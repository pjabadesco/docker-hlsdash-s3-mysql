## OLD

docker-compose build

## NEW

docker buildx build --platform=linux/amd64 --tag=docker-hlsdash-s3-mysql:latest --load .

docker tag docker-hlsdash-s3-mysql:latest pjabadesco/docker-hlsdash-s3-mysql:0.09
docker push pjabadesco/docker-hlsdash-s3-mysql:0.09

docker tag pjabadesco/docker-hlsdash-s3-mysql:0.09 pjabadesco/docker-hlsdash-s3-mysql:latest
docker push pjabadesco/docker-hlsdash-s3-mysql:latest

docker tag pjabadesco/docker-hlsdash-s3-mysql:latest ghcr.io/pjabadesco/docker-hlsdash-s3-mysql:latest
docker push ghcr.io/pjabadesco/docker-hlsdash-s3-mysql:latest

docker run --rm -it -v $PWD:/home --entrypoint bash docker-hlsdash-s3-mysql:latest
docker run -it --name mycontainer pjabadesco/docker-ffmpeg-r2 /bin/bash

ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i video.mp4 -c:v h264_nvenc -preset slow output.mp4

ffmpeg -y -hwaccel cuda -hwaccel_output_format cuda -i video.mp4 -s 3840x2160 -c:v h264_nvenc -preset veryfast -x264opts keyint=48:min-keyint=48:no-scenecut -strict -2 -r 24 -c:a aac -b:a 192k output.mp4
