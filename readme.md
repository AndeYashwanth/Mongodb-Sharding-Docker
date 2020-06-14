# Mongo Sharded Cluster with Docker

Deploy mongoDB sharded clusters with replica sets using docker containers. 

- 2 shards(with each 3 member replica set)
  - `shard1svr1`, `shard1svr2`, `shard1svr3`
  - `shard2svr1`, `shard2svr1`, `shard3svr1`
- 1 config server 3 member replica set
  - `cfgsvr1`, `cfgsvr2`, `cfgsvr3`
- 1 mongos query router
  - `mongos`

## Requirements

- [Docker](https://docs.docker.com/get-docker/)

## Initial setup

- Download mongo image from docker hub.

  ```
  docker pull mongo
  ```

- Start all containers.

  ```
  docker-compose up -d
  ```

- Initialize config server, query router and shards. (Only required once)

  (for linux)

  ```
  sh init.sh
  ```

  (for windows)

  ```
  init.ps1
  ```

## Access docker containers

- Query router

  ```
  docker exec -it mongos bash
  ```

- Config servers

  ```
  docker exec -it cfgsvr1 bash
  ```

  ```
  docker exec -it cfgsvr2 bash
  ```

  ```
  docker exec -it cfgsvr3 bash
  ```

- Shard1 replica set

  ```
  docker exec -it shard1svr1 bash
  ```

  ```
  docker exec -it shard1svr2 bash
  ```

  ```
  docker exec -it shard1svr3 bash
  ```

- Shard2 replica set (Similar to Shard1, replace shard1 with shard2)



## Access Mongo shell

To access mongo shell (i.e. mongos query router)

```
mongo --port 60000
```

***This is where you store the database.***

## Remove everything

- To stop containers

  ```
  docker stop $(docker ps -aq)
  ```

- To remove "all" containers (removes every docker container on system)

  ```
  docker rm $(docker ps -aq)
  ```

- To remove "all" volumes (deletes every docker volume on system)

  ```
  docker volume prune
  ```

or use

(for windows)

```
rm.ps1
```

(for linux)

```
sh rm.sh
```

