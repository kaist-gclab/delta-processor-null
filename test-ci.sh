#!/usr/bin/env bash

docker build -t kaistgclab/delta-processor-null .

# In CircleCI, it is not possible to mount a volume from job space
# into a container in Remote Docker. To transfer the input and output, we
# instead use the `docker cp` command in the test file. See
# https://circleci.com/docs/2.0/building-docker-images/#mounting-folders

# Create a dummy container which will hold a volume for file sharing
docker create -v /data --name volume-container kaistgclab/delta-processor-null /bin/true

# Copy any file (in this case, we use src/index.ts)
docker cp src/index.ts volume-container:/data

# Run container
docker run \
    --volumes-from volume-container \
    --name app \
    kaistgclab/delta-processor-null \
    -i index.ts \
    -o output.txt

mkdir output

# Copy output 
docker cp app:/data .

# Check output.txt file exists
FILE=data/output.txt
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
    exit 1
fi
