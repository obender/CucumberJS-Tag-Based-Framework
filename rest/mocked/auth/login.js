(function (server) {
    var headers = {'X-AUTH-TOKEN': 'some dummy token'};
    var payload = {
        "code": 200,
        "orgId": "0000s7",
        "orgName": "Informatica",

    };
    server.add("auth/login", payload, "POST", 200, headers);
    //server.add("auth/login", payload, "POST", 401, headers);
})(window.mockServer);
