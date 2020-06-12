#!/usr/bin/env bash

echo "Compiling functions to bin/handlers/ ..."

rm -rf bin/

cd handlers/

for f in */*.go; do
  filename="$(basename ${f%.go})"
  if GOOS=linux go build -o "../bin/handlers/$filename" ${f}; then
    echo "✓ Compiled $filename"
  else
    echo "✕ Failed to compile $filename!"
    exit 1
  fi
done

echo "Done."