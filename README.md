to run:

docker build -t docker-github-actions .

then

docker run \
  --detach \
  --env ACCOUNT=github-account \
  --env REPOSITORY=client-for-docker \
  --env ACCESS_TOKEN=access-token \
  --name runner \
  docker-github-actions