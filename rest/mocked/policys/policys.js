(function (server) {
    var payload = {
        "ipfilter": [{
            "fromIp": "1.2.3.4",
            "toIp": "1.2.3.5",
            "access": "Deny",
            "description": "oppokpok"
        }, {"fromIp": "1.1.1.12", "toIp": "1.1.1.44", "access": "Allow", "description": "okok"}, {
            "fromIp": null,
            "toIp": null,
            "access": "Allow",
            "description": " "
        }, {"fromIp": "1.1.1.12", "toIp": "1.1.1.44", "access": "Allow", "description": "okok"}, {
            "fromIp": null,
            "toIp": null,
            "access": "Allow",
            "description": " "
        }, {"fromIp": "1.1.1.12", "toIp": "1.1.1.44", "access": "Allow", "description": "okok"}, {
            "fromIp": null,
            "toIp": null,
            "access": "Allow",
            "description": " "
        }, {"fromIp": "1.1.1.12", "toIp": "1.1.1.44", "access": "Allow", "description": "okok"}, {
            "fromIp": null,
            "toIp": null,
            "access": "Allow",
            "description": " "
        }, {"fromIp": "1.1.1.12", "toIp": "1.1.1.44", "access": "Allow", "description": "okok"}, {
            "fromIp": null,
            "toIp": null,
            "access": "Allow",
            "description": " "
        }], "ratelimit": {"timeFrame": 70000, "quota": 1000}
    };
    server.add("/policy", payload, "GET", 200);
})(window.mockServer);
