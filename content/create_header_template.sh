hugo_version="0.79.0"
file_name="header_template.md"
prefixes=("." "blog")

# So that relative paths work
cd ~/projects/website

# The automatically created headers differ based on prefix 
# (e.g., blog). That's why we create separate template header for each.
for prefix in "${prefixes[@]}"; do
  relative_path="${prefix}/${file_name}"

  # Remove previous versions, if any
  rm -f "src/content/${relative_path}" 
  rm -f "content/${relative_path}" 

  # This creates the header template
  docker container run --rm -it \
    -v $(pwd)/src:/src \
    klakegg/hugo:${hugo_version} \
    new "$relative_path"
    
  ## Store header template in *permanent* content directory
  # Create subdirectory first, if it doesn't exist
  if [ ! -d "content/${prefix}" ]; then
    mkdir -p "content/${prefix}";
  fi
  sudo mv "src/content/${relative_path}" "content/${relative_path}"

  # Give user write access to content.
  sudo chown $(whoami):$(whoami) "content/${relative_path}"

done