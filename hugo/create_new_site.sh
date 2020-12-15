hugo_version="0.79.0"

docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:$hugo_version \
  new site blog6
