var http = require('http');
var express = require('express');
var bodyParser = require('body-parser');
var app = express()
var fetcher = require('./opten/fetcher.js');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
        extended: true
}));

app.get('/', function(req, res) {
        console.log("home");
        res.sendFile(__dirname + '/index.html');
});


app.get('/opten/', function(req, res) {
        console.log("hi");
	fetcher.getActivityForTheDay();
});

app.listen(2929);

