#~/bin/bash
#!/bin/bash

# Set the AWS profile
export AWS_PROFILE=default

# Verify that the profile is set
echo "Using AWS Profile: $AWS_PROFILE"

# Run an AWS CLI command using the profile
aws s3 ls
