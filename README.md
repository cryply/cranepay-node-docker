# cranepay-node-docker

*to run compiled image from hub.docker.com*

`docker run -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data --name cranepayd cranepay/cranepayd`

*or without debug log in demonized mode*

`docker run -d -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data --name cranepayd cranepay/cranepayd`

*or if u will have problems with container name:*

`sudo docker run -d -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data cranepay/cranepayd`


*test*

`curl --user u:x --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' localhost:48887/`

*Can require different IP than localhost*

*To build yourself use:*

`docker build -t cranepay/cranepay-node .`

License: MIT

2019 (C) Cranepay Foundation. https://cranepay.io


