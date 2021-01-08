# TEMPORARY: Delete old version
sudo rm -rf src
# =================================================================

hugo_version="0.79.1"
theme="hugo-future-imperfect" 

# To make sure that relative paths work
cd ~/projects/website

# Create directory where applicatiion files will be located.
# Note that the name "src" is hardcoded into Klakegg's docker image.
# Eventually we want to move to a docker volume instead.
mkdir src
docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new site .

# Copy theme from the themes folder in the base directory (where themes are
# permanently stored so they don't have to be re-downloaded) to the docker 
# volume/bind mount (src/themes). Don't copy themes/exampleSite. 
# TODO: Find out if any other subfolders of themes don't need to be copied.
sudo mkdir src/themes/${theme} && \
  cd themes/${theme} && \
  sudo cp -r archetypes  images  layouts  LICENSE.md  README.md  static  theme.toml  ../../src/themes/${theme} && \
  cd ../..
  
# Create customized config 
bash configs/create_config.sh | sudo tee src/config.toml > /dev/null

# Create templates for content headers
bash create_content_headers.sh

# # =================================================================
# # TEMPORARY
# section_name="blog"
# post_name="test_post"
# format="md"

# # Create test post
# docker container run --rm -it \
#   -v $(pwd)/src:/src \
#   klakegg/hugo:${hugo_version} \
#   new "${section_name}/${post_name}.${format}"

# # Give user write access to content, so that they can 
# # easily edit markdown files directly.
# sudo chown $(whoami):$(whoami) "src/content/${section_name}/${post_name}.${format}"

# echo "testing."| tee -a "src/content/${section_name}/${post_name}.${format}" 
 
# # Start server
# docker container run --rm -it \
#   -v $(pwd)/src:/src \
#   -p 1313:1313 \
#   klakegg/hugo:${hugo_version} \
#   server -wD -d "dev"
