# Ubuntu yerine image oluştur router image'ı
docker create -it --network=network1 --name container_name ubuntu 
docker network connect network2 container_name
docker start -ai container_name