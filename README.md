# to run:

`docker build -t github-docker-actions .`

## then

```
docker run \
  --detach \
  --env ACCOUNT=github-account \
  --env REPOSITORY=client-for-docker \
  --env ACCESS_TOKEN=access-token \
  --name runner \
  github-docker-actions
```
###where
*github-account* 
