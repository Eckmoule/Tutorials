var express = require('express');
var mysql = require('mysql');

var app = express();

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'yeahyeah',
  database : 'TestNode'
});

connection.connect(function(err) {
  if (err) {
    console.error('error connecting: ' + err.stack);
    return;
  }
  console.log('connected as id ' + connection.threadId);
});

connection.query('Select count(*) as count from User;', function(err, rows, fields) {
  if (err) throw err;
  console.log('There is ' + rows[0].count + ' user(s)');
});

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	var tab = [ "Test1", "Test2", "Test3" ];
    res.render('Hello.ejs', {name: "Béjannin", tab: tab});
});

app.listen(8080);