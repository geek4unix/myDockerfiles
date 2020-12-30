FROM centos:8 with pdns-auth-44 installed with sqlite backend.

also installed: 


curl, wget  (useful for grabbing resources)

jq ( make json readable )


PDNS should boot serving dns, with example.com zone loaded.


Test the Pdns Server
--------------------

bash-4.4# dig -t NS @localhost example.com +short
dns2.example.com.
dns1.example.com.
bash-4.4# echo $?
0


Test the API
------------

bash-4.4# curl -s -H 'X-API-Key: changeme' http://127.0.0.1:8081/api/v1/servers/localhost/zones | jq .
[
  {
    "account": "",
    "dnssec": false,
    "edited_serial": 2020122601,
    "id": "example.com.",
    "kind": "Native",
    "last_check": 0,
    "masters": [],
    "name": "example.com.",
    "notified_serial": 0,
    "serial": 2020122601,
    "url": "/api/v1/servers/localhost/zones/example.com."
  }
]


Build with Docker
-----------------

docker build -t "thegeek72/centos8-pdns44auth" .



Run in Docker daemonized
------------------------

docker run -dit thegeek72/centos8-pdns44auth


Run in Docker foreground
------------------------

docker run -dit thegeek72/centos8-pdns44auth /bin/bash

