# Minimal development environment for rust in a docker container

# Usage
To build and bring up the container run:
```bash
docker-compose build --build-arg USER_NAME=<user-name> --build-arg USER_EMAIL=<user-email>
docker-compose up -d
```
The `user-name`  will both be the name of the non-root user in the container as well as the `user.name` in git, the `user-email`  will only be used for `user.email`  in git. 