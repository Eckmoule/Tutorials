var express = require('express');

var app = express();
var server = app.listen(8080);

app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	res.render('Index.ejs');
});
