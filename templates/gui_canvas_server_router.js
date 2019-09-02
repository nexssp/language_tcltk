var config = require("./config.json");
var express = require("express");
var app = express();
var http = require("http").Server(app);
var redis = require("redis");
var client = redis.createClient(config.redis);
var path = require("path");
var io = require("socket.io")(http);

app.use("/", express.static(path.join(__dirname, "www")));

http.listen(8000, async function() {
  console.log(`listening on ${config.listen.host}:${config.listen.port}`);
});

client.on("message", function(chan, msg) {
  console.log(chan);
  console.log(msg);
  io.sockets.emit(chan, msg);
});

client.subscribe("foo");
