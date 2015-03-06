var express = require('express');

var app = express();

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	var tab = [ "Test1", "Test2", "Test3" ];
    res.render('Hello.ejs', {name: "Béjannin", tab: tab});
});

app.get('/TestExpress.html', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.end('This is express');
});

app.get('/Hello/:name/:firstname', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello ! How are you ' + req.params.firstname + ' ' + req.params.name);
});

app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page introuvable !');
});

app.listen(8080);