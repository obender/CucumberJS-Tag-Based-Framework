(function (server) {
    var payload = [{
        "timeStamp": "2016-12-21 03:20:59,636",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "gwolfman@informatica.com",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "UserPass",
        "rootCauseId": 102,
        "description": "The user credentials are incorrect"
    }, {
        "timeStamp": "2016-12-21 03:21:03,701",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "gwolfman@informatica.com",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "UserPass",
        "rootCauseId": 102,
        "description": "The user credentials are incorrect"
    }, {
        "timeStamp": "2016-12-21 03:21:16,342",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "gwolfman@informatica.com",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "UserPass",
        "rootCauseId": 102,
        "description": "The user credentials are incorrect"
    }, {
        "timeStamp": "2016-12-21 03:21:51,417",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "gadi@wolfman.com",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "UserPass",
        "rootCauseId": 102,
        "description": "The user credentials are incorrect"
    }, {
        "timeStamp": "2016-12-21 03:23:08,892",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "NoAutHdr",
        "rootCauseId": 101,
        "description": "There is no header of type 'Authorization', so basic authentication cannot be performed"
    }, {
        "timeStamp": "2016-12-21 03:23:09,857",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "NoAutHdr",
        "rootCauseId": 101,
        "description": "There is no header of type 'Authorization', so basic authentication cannot be performed"
    }, {
        "timeStamp": "2016-12-21 03:23:15,825",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "NoAutHdr",
        "rootCauseId": 101,
        "description": "There is no header of type 'Authorization', so basic authentication cannot be performed"
    }, {
        "timeStamp": "2016-12-21 03:23:16,072",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "NoAutHdr",
        "rootCauseId": 101,
        "description": "There is no header of type 'Authorization', so basic authentication cannot be performed"
    }, {
        "timeStamp": "2016-12-21 03:23:16,285",
        "orgInternalId": "1",
        "ipAddress": "31.168.99.194",
        "userName": "",
        "endpoint": "/t/0000s7.com/SecureEcho/1.0.0",
        "severity": "ERROR",
        "httpStatusCode": 401,
        "rootCause": "NoAutHdr",
        "rootCauseId": 101,
        "description": "There is no header of type 'Authorization', so basic authentication cannot be performed"
    }];
    server.add("/log/security", payload, "GET", 200);
})(window.mockServer);
