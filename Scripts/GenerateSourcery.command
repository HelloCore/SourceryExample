#!/bin/bash
cd "$(dirname "$0")"
cd ..

 ./Pods/Sourcery/bin/sourcery --sources ./CodeGenTemplate --templates ./Templates --output ./CodeGenTemplate/Generated