# to run:

`docker build -t github-docker-actions .`

## then

```
docker run \
  --detach \
  --env ACCOUNT=github-account \
  --env REPOSITORY=repository \
  --env ACCESS_TOKEN=access-token \
  --name runner \
  github-docker-actions
```
### where
*github-account* = your account name from github

*repository* = the target repository where PHPCS will perform the check

*access-token* = is the access token generated when creating a runner via **Settings -> Actions -> Runners** on the Github repository web page
