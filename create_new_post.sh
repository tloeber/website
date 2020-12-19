hugo_version="0.79.0"
section_name="posts"
post_name="test_post"
format="md"

# So that relative paths work
cd ~/projects/website/

docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new "${section_name}/${post_name}.${format}"

# Give user write access to content, so that they can 
# easily edit markdown files directly.
 sudo chown $(whoami):$(whoami) "src/content/${section_name}/${post_name}.${format}"