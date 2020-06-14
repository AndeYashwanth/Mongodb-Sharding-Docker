docker exec -it cfgsvr1 sh -c "mongo < /init-cfgsvr.js"
docker exec -it shard1svr1 sh -c "mongo < /init-shard1.js"
docker exec -it shard2svr1 sh -c "mongo < /init-shard2.js"
PING localhost -n 15 >NUL
docker exec -it mongos sh -c "mongo < /init-mongos.js"
pause