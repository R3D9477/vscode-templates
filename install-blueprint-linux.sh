#!/bin/bash

TARGET_DIR=vscode-templates-blueprint
TEMPLATE_FMT=__pascalCase_name__

git clone --recurse-submodules git://github.com/r3d9u11/vscode-templates.git $TARGET_DIR

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
echo "Please, add the next lines into section \"blueprint.templatesPath\" of your settings and restart VSCode:"
echo ""
echo "\"$PWD/$TARGET_DIR\"\n"
