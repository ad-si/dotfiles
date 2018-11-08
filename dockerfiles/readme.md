# Helpful Docker Commands

## Lint .travis.yml file

```fish
docker run \
  --rm \
  --volume (pwd):/project \
  --entrypoint=travis-lint \
  caktux/travis-cli \
  /project/.travis.yml
```
