require('coffee-script/register');
var http = require("http");
var express = require("express");
var app = express();
var mongoose = require('mongoose');
var port = 3700;


app.set('views', __dirname + '/tpl');
app.set('view engine', "jade");
app.engine('jade', require('jade').__express);

app.use(express.static(__dirname + '/public'));
app.use(require("connect-assets")());

mongoose.connect('mongodb://localhost:27017/livelist');

Patient = mongoose.model('Patient', {first_name: String, last_name: String})

var io = require('socket.io').listen(app.listen(port));


require('./routes')(app, mongoose, Patient);
require('./sockets')(io, Patient);

// app.listen(port);
console.log("Listening on port " + port);