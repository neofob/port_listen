A simple script to listen on a given port
=========================================
*At times, you are just too tired of typing `nc -l`...here is the script
to be used by other programs*

This script, `port_listen.sh`, returns `1` if the *listen_app* does
not exit after a timeout; otherwise, it returns 0. It relies on the
behavior of `nc/netcat`, which exits once it receives a message. I think,
I saw...who knows?

Usage
=====
**On a host machine `mickey`**
```
$ TIMEOUT=60 PORT_NUMBER=4242 ./port_listen.sh
```

**On a host machine `minnie`**
```
$ echo "Pluto is comming" | nc mickey 4242
```


The counterpart of this is [`port_establish`][0].

__author__: *tuan t. pham*


[0]: https://github.com/neofob/port_establish
