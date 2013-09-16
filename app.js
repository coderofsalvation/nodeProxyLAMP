var http  = require('http')
var httpProxy = require('http-proxy')
var config    = require("/etc/forever.d/proxyserver.json")

proxyServer = httpProxy.createServer ({
//    pathnameOnly: true,
    hostnameOnly: true,
    router: config
});

function log(msg){
  console.log((new Date()) + '> ' + msg );
}

proxyServer.listen( process.env.PORT );

log("proxyServer listening at port "+process.env.PORT );
log("config:");
console.log("%j", config );
