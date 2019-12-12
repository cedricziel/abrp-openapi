#!/usr/bin/env bash

if [[ ! -f openapi-generator-cli.jar ]]; then
	wget http://central.maven.org/maven2/org/openapitools/openapi-generator-cli/4.2.2/openapi-generator-cli-4.2.2.jar -O openapi-generator-cli.jar
fi

GO_POST_PROCESS_FILE="gofmt -s -w" java -jar openapi-generator-cli.jar generate -i abrp-openapi.yaml -g go \
    -o generated/abrp_go \
    --additional-properties packageName=abrp_go \
    --additional-properties isGoSubmodule=true \
    --type-mappings=object=interface{} \
    --enable-post-process-file \
    --skip-validate-spec

java -jar openapi-generator-cli.jar generate -i abrp-openapi.yaml -g php \
    -o generated/abrp_php \
    --type-mappings=object=interface{} \
    --skip-validate-spec
