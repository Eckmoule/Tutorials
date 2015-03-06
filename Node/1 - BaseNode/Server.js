var http = require('http');
var url = require("url");
var querystring = require('querystring');

function HandleRequest(req, res){
  var page = url.parse(req.url).pathname;
  console.log(page);
  res.writeHead(200, {"Content-Type": "text/html"});
  res.write('<!DOCTYPE html'+
  	'<html>' +
  		'<head>' +
  			'<title> My NodeJS HelloWorld </title>' +
  		'</head>');

  if(page == '/'){
  	var params = querystring.parse(url.parse(req.url).query);
  	SayHello(res, params);
  }else if(page == '/TestNode.html')
  {
  	SayTestNode(res);
  }
  else{
  	res.writeHead(404, {"Content-Type": "text/html"});
  }

  res.write('</html>');
  res.end();
}

function SayHello(res, params)
{
	res.write('<body>');
  	res.write('<h1> Hello World </h1>');
	if ('firstname' in params && 'name' in params) {
		res.write('<p>Welcome ' + params['firstname'] + ' ' + params['name'] + '</p>');	
	}else
	{
		res.write("<p>You didn't give any name / firstname</p>");
	}
	res.write('</body>');
}

function SayTestNode(res)
{
	res.write('<body>' +
  			'<h1> Test NodeJS <h1>' +
  		'</body>');
}

var server = http.createServer(HandleRequest);

server.on('close', function(){
	console.log('Bye bye');
});

server.listen(8080);