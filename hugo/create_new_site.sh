hugo_version="0.79.0"
theme="hugo-future-imperfect"
site_name="blog"

docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new site $site_name

# Copy theme using hard links.Theme already has to be cloned
# into the shared themes folder.
 cp -lr themes/${theme} ./src/