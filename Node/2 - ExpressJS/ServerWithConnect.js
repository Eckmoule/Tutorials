var express = require('express');
var app = express();

app.use(express.logger()) 
.use(express.static(__dirname, '/image'))
.use(express.favicon(__dirname, '/favicon.ico'))
.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	var tab = [ "Test1", "Test2", "Test3" ];
    res.render('Hello.ejs', {name: "Béjannin", tab: tab});
});