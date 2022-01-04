#!/usr/bin/env sh
#
# This scripts builds and optionally pushes images defined in subdirectories.
# It is used from gitlab CI pipeline but can be also be used locally.
#

if [ -z $1 ] || [ $1 == '-h' ] || [ $1 == '--help' ]; then
  echo
  echo "Usage: $0 image_directory [image_directory ...]"
  echo
  echo Define PUSH_TO_REPOSITORY to automatically push images to that repository
  echo
  exit 1
fi

# set the image tag to CI commit ref if defined
build_tag=${CI_COMMIT_REF_NAME:-latest}

start_dir=$PWD
# loop through the directories given as arguments
for dir in $*; do
  if [ ! -d $dir ]; then
    # "This is not the build directory you are looking for."
    echo "skipping $dir"
    continue
  fi

  # build all dockerfiles in each directory
  cd $dir
  for dockerfile in *.dockerfile; do
    if [ ! -f $dockerfile ]; then
      continue
    fi

    name=$(basename $dockerfile .dockerfile)

    echo "-------------------------------------------------------------------------------"
    echo " building $name in directory $dir"
    echo "-------------------------------------------------------------------------------"

    docker build -t "local/${name}:${build_tag}" -f ${name}.dockerfile $DOCKER_BUILD_OPTIONS .

    if [ -z $PUSH_TO_REPOSITORY ]; then
      continue
    fi

    echo "-------------------------------------------------------------------------------"
    echo " pushing $name to $PUSH_TO_REPOSITORY"
    echo "-------------------------------------------------------------------------------"

    for tag in $(date -Id) $(git branch --show-current) latest; do
      image_ref=${PUSH_TO_REPOSITORY}/${name}:${tag}
      echo "tagging and pushing $image_ref"
      docker tag "local/${name}:${build_tag}" ${PUSH_TO_REPOSITORY}/${name}:${tag}
      docker push ${PUSH_TO_REPOSITORY}/${name}:${tag}
    done
  done
  cd $start_dir

done
