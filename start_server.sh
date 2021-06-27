hugo_version="0.79.0"

# So that relative paths work
cd ~/projects/website/

# Reasons while we attach a separate volume for content:
# - The main src volume is re-created each time we re-create the site,
#   but we don't ever want to automatically delete content. Keeping
#   content separate reduces the risk of accidentally overwriting it.
# - We eventually want to make the main src volume a docker volume.
#   However, we will continue using a bind mount for content, since
#   we will keep editing this from outside of docker.
docker container run --rm -it \
  -v $(pwd)/src:/src \
  -v $(pwd)/content:/src/content \
  -v $(pwd)/img:/src/img \
  -p 1313:1313 \
  klakegg/hugo:${hugo_version} \
  server -D  # -d "dev
