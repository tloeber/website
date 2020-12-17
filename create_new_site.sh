hugo_version="0.79.0"
theme="hugo-future-imperfect"

# So that relative paths work
cd ~/projects/website

mkdir src
docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new site .

# Copy theme using hard links.Theme already has to be cloned
# into the shared themes folder.
 cp -lr themes/${theme} ./src/${theme}