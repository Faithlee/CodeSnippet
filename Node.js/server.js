//服务器模块
var http = require('http');

http.createServer(function(request, response){
	response.writeHead(200, {"Content-Type": "text/plain"});
	response.write("hello, world!");
	response.end();
}).listen(8888);

console.log('Sever has started!');
