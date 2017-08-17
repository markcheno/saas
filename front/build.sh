#!/bin/bash
cd src
set -e
yarn lint
yarn build
if [ -d "src/src/api" ]; then
	rsync -a --del src/src/api/ src/dist/api/
fi
set +e
cd ..
find src/dist/ -name '*.js' | xargs gzip -k
find src/dist/ -name '*.css' | xargs gzip -k
find src/dist/ -name '*.html' | xargs gzip -k
echo "Done."