#!/bin/bash
# Asking sudo
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

sudo cp iOS.simruntime/* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/
sudo cp MacOSX.sdk/* /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/
sudo cp iPhoneOS.sdk/* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
sudo cp iPhoneSimulator.sdk/* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/

RUNTIMES_DIR="/Library/Developer/CoreSimulator/Profiles/Runtimes"
if [ -d "$RUNTIMES_DIR" ]; then

for i in $(ls -l $RUNTIMES_DIR |awk '/^d/ {print $NF}');
do

dir="${RUNTIMES_DIR}/iOS ${i}/Contents/Resources/RuntimeRoot/usr/lib/"

if [ -d "$dir" ]; then
sudo cp iOS.simruntime/* "$dir"
fi

done

fi
