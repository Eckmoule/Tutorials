var express = require('express');
var handlebars = require('express3-handlebars')

var app = express();
var server = app.listen(8080);

app.use(express.static(__dirname + '/public'));

//app.enable('view cache'); For production

app.engine('hbs', handlebars({extname: 'hbs', defaultLayout: 'main.hbs'}));
app.set('view engine', 'hbs');

app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	res.render('home');
});

app.get('/simple', function(req, res){
	var data = {name: 'Gorilla'};
  	res.render('simple', data);
});

app.get('/complex', function(req, res){
  var data = {
    name: 'Gorilla',
    address: {
      streetName: 'Broadway',
      streetNumber: '721',
      floor: 4,
      addressType: {
        typeName: 'residential'
      }
    }
  };
  res.render('complex', data);
});

app.get('/loop', function(req, res){
  var basketballPlayers = [
    {name: 'Lebron James', team: 'the Heat'},
    {name: 'Kevin Durant', team: 'the Thunder'},
    {name: 'Kobe Jordan',  team: 'the Lakers'}
  ];
  
  var days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  
  var data = {
    basketballPlayers: basketballPlayers,
    days: days
  };
  
  res.render('loop', data);
});

app.get('/logic', function(req, res){
  var data = {
    upIsUp: true,
    downIsUp: false,
    skyIsBlue: "yes"
  };
  
  res.render('logic', data);
});