#!/bin/bash

pnpm i

cd api-spec && npm i && cd ..
pnpm gen:schema:watch &
pnpm dev
