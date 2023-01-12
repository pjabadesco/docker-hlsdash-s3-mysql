## OLD

docker-compose build

## NEW

docker buildx build --platform=linux/amd64 --tag=docker-hlsdash-s3-mysql:latest --load .

docker tag docker-hlsdash-s3-mysql:latest pjabadesco/docker-hlsdash-s3-mysql:0.07
docker push pjabadesco/docker-hlsdash-s3-mysql:0.07

docker tag pjabadesco/docker-hlsdash-s3-mysql:0.07 pjabadesco/docker-hlsdash-s3-mysql:latest
docker push pjabadesco/docker-hlsdash-s3-mysql:latest

docker tag pjabadesco/docker-hlsdash-s3-mysql:latest ghcr.io/pjabadesco/docker-hlsdash-s3-mysql:latest
docker push ghcr.io/pjabadesco/docker-hlsdash-s3-mysql:latest

docker run --rm -it --entrypoint bash docker-hlsdash-s3-mysql:latest
docker run -it --name mycontainer pjabadesco/docker-ffmpeg-r2 /bin/bash
