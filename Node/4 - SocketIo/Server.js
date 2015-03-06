var express = require('express');

var app = express();
var server = app.listen(8080);
var io = require('socket.io').listen(server);

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	res.render('index.ejs');
});

app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page not found');
});

io.sockets.on('connection', function (socket) {
    console.log('A client just logged in!');
    
    socket.on("message", function(message){
		console.log(socket.login + ' says : ' + message);
    })

    socket.on("login", function(login){
    	socket.login = login;
    	socket.emit('message', 'Welcome ' + login + ' !');
    	socket.broadcast.emit('message', login + ' just logged in !'); //This is send to everyone
    })
});

