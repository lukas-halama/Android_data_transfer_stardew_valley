# Stardew Valley PC-to-Android Transfer

A simple Linux Bash script to transfer a Stardew Valley save file from a PC to a connected Android device.

## How It Works

The script interactively asks you which save file to transfer, then uses `adb` (Android Debug Bridge) to push that save folder to the Stardew Valley directory on your phone.

## Requirements

* Linux (tested on Ubuntu)
* `adb` (Android Debug Bridge) installed.
* An Android device connected via USB.
* **USB Debugging** enabled on the Android device.

## How to Use

1.  Make the script executable (only need to do this once):
    ```bash
    chmod +x transfer_to_android.sh
    ```

2.  Run the script:
    ```bash
    ./transfer_to_android.sh
    ```
