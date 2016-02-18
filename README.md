## Apache https proxy server

A Docker container to run an Apache server as an https proxy. 

Create a directory conf to hold SSL key, SSL certificate and any Apache config files.
Put ssl key and certificate into conf as server.key and server.crt respectively.
Create one or more files ending with .conf to hold proxy and any additional Apache configuration.

```apache
ServerAdmin webmaster@example.com

ProxyPass /foo http://foo.example.com/bar
ProxyPassReverse /foo http://foo.example.com/bar
```

From within the conf directory run docker mounting the current dir as /conf and mapping port 443 to the host:

```bash
$ docker run -p 443:443 -v `pwd`:/conf -d apache-proxy
```
