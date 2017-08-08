let CryptoJS = require("crypto-js");

module.exports = (runNumber) => {

    let orgid = "0000s7";
    let buildNumber = "-999";

    let env_vars = {
        "id": "9780f1c0-8640-865e-e50a-16c21e18481f",
        "name": "cucumber",
        "values": [],
        "timestamp": 1479291545326
    };

    add_env_var("hosturl", "http://127.0.0.1:8080");
    add_env_var("orgid1", orgid);
    add_env_var("orgid2", orgid);
    add_env_var("buildNumber", buildNumber);
    add_env_var("runNumber", runNumber);

    getJWT_admin();

    getJWT_governor(orgid, 1);
    getJWT_governor(orgid, 2);

    getJWT_frontend(orgid, 2, 0, 1800);

    return env_vars;

    function add_env_var(key, value) {

        let entry = {
            "key": key,
            "type": "text",
            "value": value,
            "enabled": true,
            "hovered": false
        };

        for (let i=0; i<env_vars.values.length; i++) {
            if (env_vars.values[i].key == key) {
                env_vars.values[i] = entry;
                return;
            }
        }

        env_vars.values.push(entry);
    }

    function getJWT_admin(dateIncrementalInSeconds) {
        function getJWT_Admin() {
            return "gadi@wolfman.com";
        }

        function getJWT_Key() {
            return "ICRT<->APIGW";
        }

        function getBase64(text) {
            let wordArr = CryptoJS.enc.Utf8.parse(text);
            return CryptoJS.enc.Base64.stringify(wordArr);
        }

        let headersText = JSON.stringify({
            "alg": "HS256",
            "typ": "JWT"
        });

        let dateIncInSeconds = 0;
        if (dateIncrementalInSeconds) {
            dateIncInSeconds = dateIncrementalInSeconds;
        }
        let nowDate = new Date();
        nowDate.setSeconds(nowDate.getSeconds() + dateIncInSeconds);

        let iat = Math.floor(nowDate / 1000);
        let bodyText = JSON.stringify({
            "admin": true,
            "userName": getJWT_Admin(),
            "iat": iat
        });
        let signaurePassword = getJWT_Key();
        let headerTextBase64 = getBase64(headersText);
        let bodyTextBase64 = getBase64(bodyText);
        let signature = CryptoJS.HmacSHA256(headerTextBase64 + "." + bodyTextBase64, signaurePassword).toString(CryptoJS.enc.Base64);

        let jwt = headerTextBase64 + '.' + bodyTextBase64 + '.' + signature;
        add_env_var("admin-token", jwt);
    }

    function getJWT_governor(orgID, seq, dateIncrementalInSeconds) {
        function getJWT_Admin() {
            return "gadi@wolfman.com";
        }

        function getJWT_Key() {
            return "ICRT<->APIGW";
        }

        function getBase64(text) {
            let wordArr = CryptoJS.enc.Utf8.parse(text);
            return CryptoJS.enc.Base64.stringify(wordArr);
        }

        let headersText = JSON.stringify({
            "alg": "HS256",
            "typ": "JWT"
        });

        let dateIncInSeconds = 0;
        if (dateIncrementalInSeconds) {
            dateIncInSeconds = dateIncrementalInSeconds;
        }

        let nowDate = new Date();
        nowDate.setSeconds(nowDate.getSeconds() + dateIncInSeconds);

        let iat = Math.floor(nowDate / 1000);

        let orgId = orgID.replace('{{buildNumber}}', buildNumber);
        let bodyText = JSON.stringify({
            "userName": getJWT_Admin(),
            "orgId": orgId,
            "iat": iat
        });

        let signaurePassword = getJWT_Key();
        let headerTextBase64 = getBase64(headersText);
        let bodyTextBase64 = getBase64(bodyText);
        let signature = CryptoJS.HmacSHA256(headerTextBase64 + "." + bodyTextBase64, signaurePassword).toString(CryptoJS.enc.Base64);
        let jwt = headerTextBase64 + '.' + bodyTextBase64 + '.' + signature;

        add_env_var("governor-token" + seq, jwt);
    }

    function getJWT_frontend(orgID, seq, _iatOffsetSeconds, _expOffsetSeconds) {
        function getJWT_Admin() {
            return "gadi@wolfman.com";
        }

        function getJWT_Key() {
            return "BACKEND<->FRONTEND";
        }

        function getBase64(text) {
            let wordArr = CryptoJS.enc.Utf8.parse(text);
            return CryptoJS.enc.Base64.stringify(wordArr);
        }

        let headersText = JSON.stringify({
            "alg": "HS256",
            "typ": "JWT"
        });

        let iatOffsetSeconds = 0;
        if (_iatOffsetSeconds) {
            iatOffsetSeconds = _iatOffsetSeconds;
        }

        let expOffsetSeconds = 0;
        if (_expOffsetSeconds) {
            expOffsetSeconds = _expOffsetSeconds;
        }

        let nowDate = new Date();
        nowDate.setSeconds(nowDate.getSeconds() + iatOffsetSeconds);
        let expDate = new Date();
        expDate.setSeconds(expDate.getSeconds() + expOffsetSeconds);

        let iat = Math.floor(nowDate / 1000);
        let exp = Math.floor(expDate / 1000);

        let orgId = orgID.replace('{{buildNumber}}', buildNumber);
        let bodyText = JSON.stringify({
            "sub": getJWT_Admin(),
            "iss": orgId,
            "iat": iat,
            "orgName": "Informatica?",
            "exp": exp,
            "jti": "af2a7e48-0edd-47a9-bded-2e8115fe4720"
        });

        let signaurePassword = getJWT_Key();
        let headerTextBase64 = getBase64(headersText);
        let bodyTextBase64 = getBase64(bodyText);
        let signature = CryptoJS.HmacSHA256(headerTextBase64 + "." + bodyTextBase64, signaurePassword).toString(CryptoJS.enc.Base64);

        let jwt = headerTextBase64 + '.' + bodyTextBase64 + '.' + signature;
        add_env_var("frontend-token" + seq, jwt);
    }
};
