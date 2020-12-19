# TEMPORARY: Delete old version
sudo rm -rf src
# =================================================================

hugo_version="0.79.0"
theme="hugo-future-imperfect"

# To make sure that relative paths work
cd ~/projects/website

# Create directory where applicatiion files will be located.
# Note that the name "src" is hardcoded into Klakegg's docker image.
mkdir src
docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new site .

# Copy theme using hard links.Theme already has to be cloned 
# into a shared themes folder.
sudo cp -lr themes/${theme} src/themes/${theme}
# Append theme name to config
echo theme = \"${theme}\" | sudo tee -a src/config.toml