hugo_version="0.79.0"
file_name="header_template.md"
# Create a template for each item in the navigation bar that
# returns a 404 error. (Everything except "categories")
prefixes=("." "about" "blog" "itemized" "contact")

# So that relative paths work
cd ~/projects/website

# The automatically created headers differ based on prefix 
# (e.g., blog). That's why we create separate template header for each.
for prefix in "${prefixes[@]}"; do
  relative_path="${prefix}/${file_name}"

  # Remove previous versions, if any
  rm -f "src/content/${relative_path}" 
  rm -f "content/${relative_path}" 

  # This creates the header template. Note we attach the content
  # directory as a bind mount, so templates get permanently stored there
  docker container run --rm -it \
    -v $(pwd)/src:/src \
    -v $(pwd)/content:/src/content \
    klakegg/hugo:${hugo_version} \
    new "$relative_path"

  # Give user write access to content.
  sudo chown $(whoami):$(whoami) "content/${relative_path}"

done