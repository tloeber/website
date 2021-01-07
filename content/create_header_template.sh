hugo_version="0.79.0"
file_name="blog/header_template.md"

# So that relative paths work
cd ~/projects/website

#temp
rm -f src/content/"${file_name}" 
rm -f content/"${file_name}" 


docker container run --rm -it \
  -v $(pwd)/src:/src \
  klakegg/hugo:${hugo_version} \
  new "$file_name"
  
# Store header template in permanent directory
sudo mv src/content/"${file_name}" content/"${file_name}"

# Give user write access to content.
 sudo chown $(whoami):$(whoami) content/"${file_name}"
