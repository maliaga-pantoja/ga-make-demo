PWD = $(shell pwd)
login:
  aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${ECR_REGISTRY}
build_container:
  docker build -t ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG} .
push:
  docker push  ${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}
