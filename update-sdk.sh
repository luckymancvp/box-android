#!/bin/sh
# Install all available sdk tools
export ANDROID_UPDATE_FILTER="`tr '\n' ',' <$WERCKER_SOURCE_DIR/filter.list`"
echo "export ANDROID_UPDATE_FILTER=\"${ANDROID_UPDATE_FILTER}\"" | sudo tee -a $profile

# echo list sdk
echo "List SDK available "
android list sdk
echo "Start SDK update "
expect -f /pipeline/build/android-update-all.exp
echo "Finish SDK update"
