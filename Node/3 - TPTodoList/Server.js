var express = require('express');
var session = require('cookie-session')
var bodyParser = require('body-parser')

var app = express();

app.use(session({
  keys: ['list'],
  secureProxy: false 
}))

app.use(bodyParser.urlencoded({
  extended: true
}));

app.get('/', function(req, res){
	if(typeof(req.session.list) == 'undefined')
	{
		req.session.list = new Array();
	}
	res.setHeader('Content-Type', 'text/html');
	res.render('TodoList.ejs', {todoList: req.session.list});
})

app.post('/', function(req, res){
	req.session.list.push(req.body.newTodo);
	res.redirect('/');
});

app.get('/delete/:position', function(req, res){
	req.session.list.splice(req.params.position, 1);
	res.redirect('/');
});

app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page introuvable !');
});

app.listen(8080);