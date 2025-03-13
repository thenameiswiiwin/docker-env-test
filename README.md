# docker-env-test

## Features

- Ensures curl fetches the setup script into ~/ and executes it.
- Automatically installs dependencies (git, curl).
- Uses docker-compose.yml for multi-container testing.
- Supports Ubuntu, Arch Linux, Alpine, and Windows.

- This setup fully automates your dotfile deployment testing across all major OS environments.

## Running Containers

1. Build and start all containers

```sh
docker-compose up --build
```

2. Run a specific OS

```sh
docker-compose up --build ubuntu
docker-compose up --build arch
```

3. Access a container and verify installation

```sh
docker exec -it test-ubuntu bash
docker exec -it test-arch bash
```
