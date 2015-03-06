var http = require('http');
var url = require("url");
var querystring = require('querystring');
var EventEmitter = require('events').EventEmitter;
var testModule = require('./module');

var server = http.createServer(HandleRequest);
var game = new EventEmitter();

server.on('close', function(){
	console.log('Bye bye');
});

game.on('gameover', function(message){
    console.log(message);
});

function HandleRequest(req, res){
	testModule.sayHello(); 
	res.writeHead(200, {"Content-Type": "text/html"});
	res.end();
	testModule.sayGoodBye();
}

game.emit('gameover', 'You lose !');

server.listen(8080);