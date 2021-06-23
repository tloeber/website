hugo_version="0.79.0"
file_name="header_template.md"
# Create a template for each item in the navigation bar that
# returns a 404 error otherwise. (Everything except "categories")
prefixes=("." "about" "blog" "itemized" "contact")

# So that relative paths work
cd ~/projects/website

# The automatically created headers differ based on prefix 
# (e.g., blog). That's why we create separate template header for each.
for prefix in "${prefixes[@]}"; do
  relative_path="${prefix}/${file_name}"

  # # Remove previous versions, if any
  cd content && \
    sudo rm -rf "$relative_path" && \
    cd ../

  # This creates the header template. Note we don't attach the usual content 
  # directory. The directory attached will only contain the templates and won't 
  # get attached when we run the server, because it won't contain any actual content.
  docker container run --rm -it \
    -v $(pwd)/src:/src \
    -v $(pwd)/content:/src/content \
    klakegg/hugo:${hugo_version} \
    new "$relative_path"

  # Give user write access to content. (Since one prefix consists of just ".",
  # we first cd into "content" rather than concatenating everything)
  cd content && \
    sudo chown $(whoami):$(whoami) "${relative_path}" && \
    cd ../


done