<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<!--[if lte IE 9]>
<html class="ie" lang="en">
<![endif]-->
<!--[if gt IE 9]><!-->
<html>
<head>
<meta charset="UTF-8">
<meta name="google" value="notranslate">

<title>CodePen - React Instagram stream by hashtag</title>

<link rel="stylesheet" href="//codepen.io/assets/reset/normalize.css">


<style>
.item

  
display
:
 
flex

  
align-items
:
 
center

  
border-bottom
:
 
1
px
 
solid
 
#DDD

  
padding
:
 
20
px

  
&
__pic

    
width
:
 
100
px

    
height
:
 
100
px

    
flex
:
 
0
0
100
px

    
margin-right
:
 
20
px

    
overflow
:
 
hidden

    
border-radius
:
 
100%
img

      
width
:
 
100%
height
:
 
auto

  
&
__content

    
word-wrap
:
 
break-word

  
&
__author

    
font-weight
:
 
700
font-size
:
 
18
px

    
margin-bottom
:
 
15
px

  
&
__text

    

h1

  
text-align
:
 
center

  

.animation-enter

  
opacity
:
 
0
transform
:
 
perspective
(1000px)
 
rotateX
(70deg)
 
translateY
(-3em)

  
background
:
 
#FFFBE6



.animation-enter
.animation-enter-active

  
opacity
:
 
1
transform
:
 
perspective
(1000px)
 
rotateX
(0deg)
 
translateY
(0)

  
background
:
 
transparent

  
transition
:
 
opacity
 
.5s
 
ease-out
,
transform
 
.5s
 
ease-out
,
background
 
1
s
 
ease
</style>

<script>
	window.console = window.console || function(t) {
	};
</script>


</head>

<body>

	<div id="content">
		<div class="items" data-reactid=".0">
			<h1 data-reactid=".0.0">Items</h1>
			<form class="form" data-reactid=".0.1">
				<input type="text" placeholder="Tag name" data-reactid=".0.1.0"><input
					type="submit" value="Get" data-reactid=".0.1.1">
			</form>
			<div class="items__list" data-reactid=".0.2">
				<span data-reactid=".0.2.0">
				</span>
			</div>
		</div>
	</div>
	<script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-f961f59a28ef4fd551736b43f94620b5.js"></script>
	<script src="http://codepen.io/chriscoyier/pen/yIgqi.js"></script>
	<script src="https://fb.me/react-with-addons-0.13.3.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js"></script>

	<script type="text/jsx">
      'use strict';

const LOG = false,
      TAGNAME = '¤§',
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
      //@ sourceURL=pen.js
    </script>


	<script type="text/jsx">
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>





</body>
</html>