#!/usr/bin/env bash

docker build -t kaistgclab/delta-processor-null .

# In CircleCI, it is not possible to mount a volume from job space
# into a container in Remote Docker. To transfer the input and output, we
# instead use the `docker cp` command in the test file. See
# https://circleci.com/docs/2.0/building-docker-images/#mounting-folders

# Create a dummy container which will hold a volume for file sharing
docker create \
    -v /data \
    --name vcontainer \
    kaistgclab/delta-processor-null \
    /bin/true

# Copy any file (in this case, we use src/index.ts)
INPUT_FILE=index.ts
docker cp "src/$INPUT_FILE" vcontainer:/data

# Run container
docker run \
    --volumes-from vcontainer \
    --name app \
    kaistgclab/delta-processor-null \
    -i "$INPUT_FILE" \
    -o output.txt

# Copy output (the entire `data` directory is copied to the current location)
docker cp app:/data .

# Check output.txt file exists
OUTPUT_FILE=data/output.txt
if [ -f "$OUTPUT_FILE" ]; then
    echo "$OUTPUT_FILE exists."
else 
    echo "$OUTPUT_FILE does not exist."
    exit 1
fi
