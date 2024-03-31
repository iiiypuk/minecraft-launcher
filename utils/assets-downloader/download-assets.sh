#!/bin/sh

UTILITY=$(mktemp)
base64 -d assets-x86_64-linux.data > $UTILITY
chmod +x $UTILITY

ASSETS=$($UTILITY assets/indexes/1.19.json)
FILES=$(echo "$ASSETS" | wc -w)
ASSETS_DIR=assets/objects

mkdir -p $ASSETS_DIR

FILE_COUNTER=0
for FILE in $ASSETS
do
    HASH=$(echo $FILE | cut -d ":" -f 1)
    SIZE=$(echo $FILE | cut -d ":" -f 2)

    HASH_DIR=$ASSETS_DIR/${HASH:0:2}
    mkdir -p $HASH_DIR

    if ! [ -f $HASH_DIR/$HASH ]; then
      curl --silent -o $HASH_DIR/$HASH "https://resources.download.minecraft.net/${HASH:0:2}/$HASH"
    fi

    FILE_SIZE=$(wc -c $HASH_DIR/$HASH | cut -d " " -f 1)
    if (( $FILE_SIZE != $SIZE )); then
        rm $HASH_DIR/$HASH
        echo "Error download: $HASH"
    fi

    FILE_COUNTER=$(($FILE_COUNTER + 1))
    echo -e "Progress: $FILE_COUNTER/$FILES"
done
