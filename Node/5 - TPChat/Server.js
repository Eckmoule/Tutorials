var express = require('express');

var app = express();
var server = app.listen(8080);
var io = require('socket.io').listen(server);

io.login = "";

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	res.render('index.ejs', {login: io.login});
});

app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page not found');
});

io.sockets.on('connection', function (socket) {
	
	socket.on("login", function(login){
		socket.login = login;
		socket.broadcast.emit('new_connection', socket.login);
		console.log(socket.login + " as just joined the room.");
	});

	socket.on("message", function(message)
	{
		socket.broadcast.emit('message', {login: socket.login, message: message})
		console.log(socket.login + ": " + message);
	});
});