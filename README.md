# cranepay-node-docker

*to run compiled image from hub.docker.com*

`docker run -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data  cranepay/cranepay-node`

*or without debug log in demonized mode*

`docker run -d -p 48886:48886 -p 127.0.0.1:48887:48887 -v data:/data  cranepay/cranepay-node`

*To build yourself use:*

`docker build -t cranepay/cranepay-node .`

License: MIT

2019 (C) Cranepay Foundation. https://cranepay.io


