var express = require('express'),
	hbs = require('express-hbs'),
	app = express(),
	server = app.listen(8080);

app.use(express.static(__dirname + '/public'));

//app.enable('view cache'); For production

// set the view engine
app.set('view engine', 'hbs');

// configure view engine
app.engine('hbs', hbs.express3({  
  defaultLayout: __dirname + '/views/layouts/mainBootstrap.hbs',
  partialsDir: __dirname + '/views/partials',
  layoutsDir: __dirname + '/views/layouts'
}));


app.get('/', function(req, res){
	res.setHeader('Content-Type', 'text/html');
	var data = { Title: 'Title test' }
	res.render('homeBootstrap', data);
});