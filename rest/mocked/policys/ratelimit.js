(function (server) {
    var payload = {"timeFrame": 70000, "quota": 1000};
    server.add("/ratelimit", payload, "PUT", 200);
    server.add("/ratelimit", payload, "DELETE", 200);
})(window.mockServer);
