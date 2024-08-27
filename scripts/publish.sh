#!/bin/sh

set -e

export TAG_VERSION=$(git describe --tags --abbrev=0 | sed 's/^v[.]//;s/^v//')
export GIT_HEAD=$(git rev-parse HEAD)

pnpm i --frozen-lockfile
pnpm update:version

pnpm build

cd dist/element-plus
# npm publish --provenance
npm publish
cd -

# cd internal/eslint-config
# npm publish
# cd -
#
# cd internal/metadata
# pnpm build
# npm publish
# cd -

echo "✅ Publish completed"
