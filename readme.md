# Pasos para crear una imagen de docker React con el host nginx
- [x] docker build -t myapp .
- [x] docker run -d -p 8080:8080 myapp
- [x] docker ps
- [x] docker stop <container_id>
- [x] docker rm <container_id>
- [x] docker rmi <image_id>