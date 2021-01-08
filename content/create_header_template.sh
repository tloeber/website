hugo_version="0.79.0"
file_names=("blog/header_template_blog.md" "header_template_general.md")

# So that relative paths work
cd ~/projects/website

# The automatically created headers differ based on prefix 
# (e.g., blog). That's why we grade separate template header for each.
for fn in "${file_names[@]}"; do
  #temp
  rm -f "src/content/${fn}" 
  rm -f "content/${fn}" 

  docker container run --rm -it \
    -v $(pwd)/src:/src \
    klakegg/hugo:${hugo_version} \
    new "$fn"
    
  # Store header template in permanent directory
  sudo mv "src/content/${fn}" "content/${fn}"

  # Give user write access to content.
  sudo chown $(whoami):$(whoami) "content/${fn}"

done