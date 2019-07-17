* Write Ansible role for `port_listen.sh` and `port_establish`
    * Deploy {"server": [HOST, REMOTE_DEST], "client": [HOST, REMOTE_DEST]}
    * Execute (Delay, maybe?)
    * Gather result (STDOUT, STDERR, returned code)
    * Teardown (removed deployed executables)

* Similarly to the above flow but with docker image workflow
    * Pull image on {"server": [HOST], "client": [HOST]}
    * Deploy appropriate `docker-compose.yml` on "server" and "client"
    * docker-compose up
    * Gather result
    * Teardown: `docker rmi`, remove `docker-compose.yml`

* Write `docker-compose.yml` to spin up docker container
