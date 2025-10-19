#!/bin/bash

# --- Configuration ---
PC_SAVES_DIR="$HOME/.config/StardewValley/Saves"
ANDROID_DEST_DIR="/sdcard/StardewValley/"
# ---------------------

echo "Starting Stardew Valley PC-to-Android Transfer..."

# 1. Check if adb is installed
if ! command -v adb &> /dev/null
then
    echo "Error: adb (Android Debug Bridge) is not installed."
    echo "Please install it (e.g., 'sudo apt install android-tools-adb') and try again."
    exit 1
fi

# 2. Wait for device
echo "Waiting for Android device..."
echo "Please connect your phone and enable USB Debugging."
adb wait-for-device
echo "Device found!"
echo ""

# 3. Select which save to transfer
if [ ! -d "$PC_SAVES_DIR" ]; then
    echo "Error: PC Save directory not found at $PC_SAVES_DIR"
    exit 1
fi

cd "$PC_SAVES_DIR"
echo "Please select the save file to transfer:"

# This 'select' loop creates an interactive menu
select SAVE_FOLDER in */; do
    # Check if the user's choice ($SAVE_FOLDER) is valid
    if [ -n "$SAVE_FOLDER" ]; then
        break
    else
        echo "Invalid selection. Press the number for your choice."
    fi
done

# 4. Push the selected folder to Android
echo ""
echo "Transferring '$SAVE_FOLDER' to $ANDROID_DEST_DIR on your phone..."
adb push "$SAVE_FOLDER" "$ANDROID_DEST_DIR"

echo "-----------------------------------------"
echo "✅ Transfer complete!"
echo "You can now load this save on your phone."
