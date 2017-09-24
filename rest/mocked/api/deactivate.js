(function (server) {
    server.add("/state", {"state": "Active"}, "PUT", 200);
})(window.mockServer);
