# litecoin-core-docker

You can run the latest available image as follows:
```bash
docker run -d \
-v "$(pwd)"/litecoin-data:/root/.litecoin \
--name litecoin-core \
-p 8333:8333 \
--restart always \
brunneis/litecoin-core
```

All the available tags are listed [here](https://hub.docker.com/r/brunneis/litecoin-core/tags/).
