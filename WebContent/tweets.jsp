<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script	src="http://codepen.io/chriscoyier/pen/yIgqi.js" type="text/javascript"></script>
<script	src="https://fb.me/react-with-addons-0.13.3.js" type="text/javascript"></script>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js" type="text/javascript"></script>
<!-- <script	src="" type="text/javascript"></script> -->
<script>
'use strict';

const LOG = false,
      TAGNAME = '위안부',
      COUNT = 10,
      INTERVAL = 1000;

var ReactCSSTransitionGroup = React.addons.CSSTransitionGroup;

console.clear();

var Item = React.createClass({
  render: function() {
    return (
      <div className="item">
        <div className="item__pic">
          <img src={this.props.pic} />
        </div>
        <div className="item__content">
          <div className="item__author">{this.props.author}</div>
          <div className="item__text">{this.props.children}</div>
        </div>
      </div>
    );
  }
});

var ItemBox = React.createClass({
  loadItemsFromServer: function() {
    var self = this;
    $.ajax({
      url: 'https://api.instagram.com/v1/tags/' + self.state.tagName + '/media/recent?client_id=0c4a119af8d54538af6061cb3b5ff617&start=0&count=' + self.props.count + '&callback=?',
      jsonp: "callback",
      dataType: "jsonp",
      cache: false,
      success: function(data) {
        if (LOG) {
          console.log(data);
        }
        this.setState({data: data.data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(xhr, status, err.toString());
      }.bind(this)
    });
  },
  handleTagNameSubmit: function(tagName) {
    this.setState({tagName: tagName});
  },
  getInitialState: function() {
    return { data: [], tagName: this.props.tagNameDefault };
  },
  componentDidMount: function() {
    this.loadItemsFromServer();
    setInterval(this.loadItemsFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="items">
        <h1>Items</h1>
        <ParamsForm onSubmit={this.handleTagNameSubmit} />
        <ItemList data={this.state.data} />
      </div>
    );
  }
});

var ItemList = React.createClass({
  render: function() {
    var itemNodes = this.props.data.map(function (item, i) {
      var name,
          text = 'No caption :(';
      if (item.caption) {
        text = item.caption.text;
      }
      return (
          <Item key={i} author={item.user.full_name} pic={item.images.thumbnail.url}>{text}</Item>
      );
    });
    return (
      <div className="items__list">
      <ReactCSSTransitionGroup transitionName="animation">
        {itemNodes}
      </ReactCSSTransitionGroup>
      </div>
    );
  }
});

var ParamsForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var tagName = React.findDOMNode(this.refs.tagName).value.trim();
    if (!tagName) {
      return;
    }
    this.props.onSubmit(tagName);
    React.findDOMNode(this.refs.tagName).value = '';
    return;
  },
  render: function() {
    return (
      <form className="form" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Tag name" ref="tagName" />
        <input type="submit" value="Get" />
      </form>
    );
  }
});

React.render(
  <ItemBox tagNameDefault={TAGNAME} count={COUNT} pollInterval={INTERVAL} />,
  document.getElementById('content')
);
</script>

<style type="text/css">
.item {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  border-bottom: 1px solid #DDD;
  padding: 20px;
}
.item__pic {
  width: 100px;
  height: 100px;
  -webkit-box-flex: 0;
  -webkit-flex: 0 0 100px;
      -ms-flex: 0 0 100px;
          flex: 0 0 100px;
  margin-right: 20px;
  overflow: hidden;
  border-radius: 100%;
}
.item__pic img {
  width: 100%;
  height: auto;
}
.item__content {
  word-wrap: break-word;
}
.item__author {
  font-weight: 700;
  font-size: 18px;
  margin-bottom: 15px;
}

h1 {
  text-align: center;
}

.animation-enter {
  opacity: 0;
  -webkit-transform: perspective(1000px) rotateX(70deg) translateY(-3em);
          transform: perspective(1000px) rotateX(70deg) translateY(-3em);
  background: #FFFBE6;
}

.animation-enter.animation-enter-active {
  opacity: 1;
  -webkit-transform: perspective(1000px) rotateX(0deg) translateY(0);
          transform: perspective(1000px) rotateX(0deg) translateY(0);
  background: transparent;
  -webkit-transition: opacity 0.5s ease-out, background 1s ease, -webkit-transform 0.5s ease-out;
  transition: opacity 0.5s ease-out, background 1s ease, -webkit-transform 0.5s ease-out;
  transition: opacity 0.5s ease-out, transform 0.5s ease-out, background 1s ease;
  transition: opacity 0.5s ease-out, transform 0.5s ease-out, background 1s ease, -webkit-transform 0.5s ease-out;
}

</style>
</head>
<body>

</body>
</html>