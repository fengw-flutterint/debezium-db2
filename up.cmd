docker run -d --name namo-db2 -e LICENSE=accept -e DB2INST1_PASSWORD=db2inst1 -e DBNAME=namo -p 50000:50000 -v D:/namo-db2data:/database mydb2image db2start

docker exec -it namo-db2 bash -c "su - db2inst1" 

