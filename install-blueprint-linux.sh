#!/bin/bash

TARGET_DIR=vscode-templates-blueprint
TEMPLATE_FMT=__name__

git clone --recurse-submodules --quiet git://github.com/r3d9u11/vscode-templates.git $TARGET_DIR 2> /dev/null

shopt -s extglob

for LANG_DIR in $TARGET_DIR/*; do
    for TEMPLATE_DIR in $LANG_DIR/*; do
        if [ -d "$TEMPLATE_DIR" ]; then
            TEMPLATE_PATH=$(basename "$TEMPLATE_DIR")
            TEMPLATE_PATH="$LANG_DIR - ${TEMPLATE_PATH//_/ }"
            mkdir -p "$TEMPLATE_PATH"
            mv "$TEMPLATE_DIR" "$TEMPLATE_PATH/$TEMPLATE_FMT"
        fi
    done
    rm -rf "$LANG_DIR"
done

find "$TARGET_DIR" -name ".git*" -print0 | xargs -0 rm -rf
find "$TARGET_DIR" -name "README.md" -print0 | xargs -0 rm -rf

echo ""
echo ""
echo "DONE."
echo "NOTE: Please, add the next line into section \"blueprint.templatesPath\" of your settings and restart VSCode:"
echo ""
echo "\"$PWD/$TARGET_DIR\""
echo ""
echo ""
