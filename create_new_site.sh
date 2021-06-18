hugo_version="0.79.1"
theme="hugo-future-imperfect" 

# To make sure that relative paths work
cd ~/projects/website

# Create directory where applicatiion files will be located.
# Note that the name "src" is hardcoded into Klakegg's docker image.
# TODO: move to a docker volume instead.
# TEMPORARY: Delete old version
sudo rm -rf src && \
  mkdir src  # rm -rf src/* wouldn't delete hidden files
docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new site .

# Copy theme from  themes/ in the base directory (where themes are
# permanently stored so they don't have to be re-downloaded) to the docker 
# volume/bind mount (src/themes). 
# Copy individual directory so we can exclude themes/exampleSite. 
# TODO: Find out if any other subfolders of themes/ can be excluded too.
sudo mkdir src/themes/${theme} && \
  cd themes/${theme} && \
  sudo cp -r archetypes  images  layouts  LICENSE.md  README.md  static  theme.toml  ../../src/themes/${theme} && \
  cd ../..

# This creates config by combining a template with content.
# (Separated to distinguish config changes from content changes).
bash configs/create_config.sh | sudo tee src/config.toml > /dev/null

# Create templates for content headers
bash create_header_template.sh