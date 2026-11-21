#!/usr/bin/env bash

set -euo pipefail
set -m

find src/*{yml,jinja.html} | entr -s 'minijinja-cli src/index.jinja.html src/index.yml > src/index.html' &

npx parcel src/index.html

kill %1

echo "foregrounding minijinja entr"
fg