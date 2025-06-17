#!/bin/bash

pnpm i
pnpm playwright install
pnpm playwright install-deps

cd api-spec && npm i && cd ..
pnpm gen:schema:watch &
pnpm dev
