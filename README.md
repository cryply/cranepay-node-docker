# cranepay-node-docker

*to run compiled image from hub.docker.com*

`docker run -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data  cranepay/cranepay-node`

*or without debug log in demonized mode*

`docker run -d -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data  cranepay/cranepay-node`

*test
`curl --user u:x --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' localhost:48887/`

*To build yourself use:*

`docker build -t cranepay/cranepay-node .`

License: MIT

2019 (C) Cranepay Foundation. https://cranepay.io


