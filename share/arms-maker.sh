#!/usr/bin/env bash -x

TMPFILE=`mktemp`

pbpaste > $TMPFILE
SLUG=`yq .slug $TMPFILE`

if [ -e "$SLUG.yaml" ]; then
    echo "Error: File '$SLUG.yaml' already exists."
    exit 1
fi

mv $TMPFILE $SLUG.yaml

echo "Notice: Created '$SLUG.yaml'"
