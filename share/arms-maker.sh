#!/usr/bin/env bash -x

TMPFILE=`mktemp`

pbpaste > $TMPFILE
SLUG=`yq .slug $TMPFILE | head -n1`

if [ -e "$SLUG.md" ]; then
    echo "Error: File '$SLUG.md' already exists."
    exit 1
fi

## echo '---' > $SLUG.md
cat $TMPFILE >> $SLUG.md
## echo '---' >> $SLUG.md

echo "Notice: Created '$SLUG.md'"
cat $SLUG.md
