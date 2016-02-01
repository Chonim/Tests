<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name=description content="">
    <meta name=viewport content="width=device-width, initial-scale=1">
    <title>First Component</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.0-beta.1/react.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.0-beta.1/JSXTransformer.js"></script>
    
</head>
<body>
<div id="greeting-div"></div>
	
    <script type="text/jsx">
    var RandomMessage = React.createClass({
  getInitialState: function() {
    return {message: 'Hello, Universe'};
  },
  _onClick: function() {
    var messages = ['Hello, World', 'Hello, Planet', 'Hello, Universe'];
    var randomMessage = messages[Math.floor((Math.random() * 3))];

    this.setState({message: randomMessage});
  },
  render: function() {
    return (
      <div>
        <MessageView message={this.state.message}/>
        <p><input type="button" onClick={this._onClick} value="Change Message"/></p>
      </div>
    )
  }
});
    </script>
</body>
</html>