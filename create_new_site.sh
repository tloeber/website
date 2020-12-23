# TEMPORARY: Delete old version
sudo rm -rf src
# =================================================================

hugo_version="0.79.1"
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

# Copy theme using hard links.Theme already has to be cloned  into a shared themes folder. 
# Don't copy exampleSite. 
cd themes/${theme} && \
  sudo cp -lr archetypes  images  layouts  LICENSE.md  README.md  static  theme.toml  ../../src/themes/${theme} && \
  cd ../..

sudo cp configs/config.toml src/

