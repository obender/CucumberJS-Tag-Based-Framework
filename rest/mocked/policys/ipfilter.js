(function (server) {
    var payload = [{
        "fromIp": "34.34.34.34",
        "toIp": "34.34.34.34",
        "access": "Allow",
        "description": "sdfsdfsdf"
    }, {"fromIp": "1.2.3.4", "toIp": "1.2.3.5", "access": "Deny", "description": "oppokpok"}, {
        "fromIp": "1.1.1.12",
        "toIp": "1.1.1.44",
        "access": "Allow",
        "description": "okok"
    }, {"fromIp": null, "toIp": null, "access": "Allow", "description": " "}];
    server.add("/policy/ipfilter", payload, "PUT", 200);
})(window.mockServer);
