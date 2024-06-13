# PUPPET CONFIG FILE FOR OPTIMIZING WEB SERVER
NGINX OPTIMIZATION
--------------------------------------
Tho nginx is high perfoming web server, fine tuning server configuration
can help to furthe improve th perfomance among the config file declartive 
to config for optimization are
1 worker processes
2 worker connection
3 multi accept connection mode
This are the main fine tuning to  done

worker-processes - worker processes should be same number as system available
cores
worker-connection - max number of file descriptors pr process (1024)

multi-accept - mode at which worker process process incoming connection
should be set to on to accept more that one connection at atime when ther is
high trafic


<kiptooharon.hk@gmail.com> 
