#!/bin/sh

# Exit immediately if a command fails
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Ensure keytool is available
if ! command_exists keytool; then
    echo "[-] Error: 'keytool' is not installed or not in your PATH." >&2
    exit 1
fi

# Select the available hex converter
if command_exists hexdump; then
    HEX_CONVERTER="hexdump -ve '/1 \"%02x\"'"
elif command_exists xxd; then
    HEX_CONVERTER="xxd -p -c 0"
else
    echo "[-] Error: Neither 'hexdump' nor 'xxd' was found. Please install one." >&2
    exit 1
fi

# Interactive input if arguments are missing
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "=== JKS Certificate Hex Extractor ==="
    printf "Enter path to your .jks file: "
    read -r KEYSTORE
    printf "Enter your key alias: "
    read -r ALIAS
else
    KEYSTORE="$1"
    ALIAS="$2"
fi

# Check if the keystore file actually exists
if [ ! -f "$KEYSTORE" ]; then
    echo "[-] Error: File '$KEYSTORE' does not exist." >&2
    exit 1
fi

TEMP_FILE="temp_cert_output.der"

echo "\n[+] Step 1: Exporting certificate from keystore..."
# keytool will securely prompt you for your keystore password here
keytool -exportcert -keystore "$KEYSTORE" -alias "$ALIAS" -file "$TEMP_FILE"

echo "[+] Step 2: Converting binary DER to lowercase hex..."
# Run converter and force lowercase just to be absolutely sure
HEX_STRING=$(eval "$HEX_CONVERTER" "$TEMP_FILE" | tr '[:upper:]' '[:lower:]')

# Clean up the temporary binary file
rm -f "$TEMP_FILE"

echo "\n================ HARDCODED HEX VALUE ================"
echo "$HEX_STRING"
echo "====================================================="
echo "\n[+] Done! Copy the massive wall of text above into your '0000-Allow-AOSP-cert.patch'."
