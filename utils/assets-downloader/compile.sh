#!/bin/sh

# build utility
echo "Build: assets-x86_64-linux.data"
base64 -w 0 build/linux/x86_64/release/assets-parser > assets-x86_64-linux.data
echo "Build complete"
