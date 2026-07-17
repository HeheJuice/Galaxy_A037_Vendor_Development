#!/bin/sh

# 1. Ensure the 'patch' utility is installed
if ! command -v patch >/dev/null 2>&1; then
    echo "[*] 'patch' utility not found. Installing..."
    pkg install patch -y
fi

# 2. CONFIGURATION PATHS
# Adjust these paths to match where your files are stored
PATCH_FILE="$HOME/patches/0000-Allow-AOSP-cert.patch"
SERVICES_SRC="$HOME/services_decompiled" 

# 3. Validation Checks
if [ ! -f "$PATCH_FILE" ]; then
    echo "[-] Error: Patch file not found at: $PATCH_FILE"
    exit 1
fi

if [ ! -d "$SERVICES_SRC" ]; then
    echo "[-] Error: Decompiled services.jar folder not found at: $SERVICES_SRC"
    echo "    Please ensure you have decompiled services.jar first."
    exit 1
fi

# 4. Apply the patch
cd "$SERVICES_SRC" || exit 1

echo "[+] Target folder verified: $SERVICES_SRC"
echo "[*] Applying framework patch..."

# -p1 strips the leading directory level from the patch file path structure.
# If the patch fails, try changing -p1 to -p0 or -p2 depending on how the patch was generated.
patch -p1 < "$PATCH_FILE"

if [ $? -eq 0 ]; then
    echo "------------------------------------------------"
    echo "[+] SUCCESS: services.jar source code successfully patched!"
    echo "[*] Next step: Recompile and sign services.jar using APKTool M."
    echo "------------------------------------------------"
else
    echo "------------------------------------------------"
    echo "[-] FAILED: The patch could not be cleanly applied."
    echo "    This usually means the smali code structure in your ROM's"
    echo "    services.jar is slightly different from the patch's target."
    echo "------------------------------------------------"
    exit 1
fi
