var pd = require('pretty-data').pd;
module.exports = {
    format: {
        json: function() {
            var i = process.stdin, d = '';
            i.resume();
            i.setEncoding('utf8');
            i.on('data', function(data) { d += data; });
            i.on('end', function() {
                try {
                    console.log(JSON.stringify(JSON.parse(d), null, 4));
                } catch(ex) {
                    console.log(d);
                }
            });
        },
        xml: function() {
            var i = process.stdin, d = '';
            i.resume();
            i.setEncoding('utf8');
            i.on('data', function(data) { d += data; });
            i.on('end', function() {
                try {
                    console.log(pd.xml(d));
                } catch(ex) {
                    console.log(d);
                }
            });
        }
    },
    translate: {
        en: function(text) {
            this.tr('en', text);
        },
        ja: function(text) {
            this.tr('ja', text);
        },
        ko: function(text) {
            this.tr('ko', text);
        },
        tr: function(source, text) {
            var https = require('https');

            var client_id = '_IEO_LUqrcscXBRQHDeV';
            var client_secret = 'aXo1T28OTO';
            var host = 'openapi.naver.com';
            var port = 443;
            var uri = '/v1/language/translate';

            var data = require('querystring').stringify({
                source: source,
                target: source !== 'ko' ? 'ko' : 'en',
                text: text
            });

            var options = {
                host: host,
                port: port,
                path: uri,
                method: 'POST',
                headers: {
                    'X-Naver-Client-Id':client_id,
                    'X-Naver-Client-Secret': client_secret,
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'Content-Length': Buffer.byteLength(data)
                }
            };

            var req = https.request(options, function(res) {
                res.setEncoding('utf8');
                res.on('data', function (chunk) {
                    console.log(JSON.parse(chunk).message.result.translatedText);
                });
            });
            req.write(data);
            req.end();
        }
    }
};
