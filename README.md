# Ghost with custom UID/GID
`microbug/ghost`

This image is `library/ghost:alpine` with a user-settable UID and GID.

## Usage
The UID and GID of the `node` user (who runs Ghost in the container) can be set through
environment variables. Examples below use the usual default of UID and GID both equal to
1000, substitute your own for different situations.

Because the `node` user has the right permissions, you can pass through a folder to map to `/var/lib/ghost` to enable persistence. On the host you should do `chown -R 1000:1000 FOLDER_NAME` on each folder that you will map.

### docker-compose
Check [the official Ghost Docker page](https://github.com/_/ghost) for further config options.

```yaml
version: '3'

services:
  ghost:
    image: microbug/ghost:latest
    environment:
      - UID=1000
      - GID=1000
    volumes:
      - /your/var/lib/ghost/folder:/var/lib/ghost:rw
    ports:
      - "2368:3001"
```

### docker run
Check [the official Ghost Docker page](https://github.com/_/ghost) for further config options.

```bash
docker run -d \
    -p 2368:3001 \
    --env UID=1000 \
    --env GID=1000 \
    -v /your/var/lib/ghost/folder:/var/lib/ghost:rw \
    microbug/ghost:latest
```
