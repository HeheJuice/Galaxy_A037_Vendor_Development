### 🗺️ Galaxy A03s Vendor Development
- Custom Vendor Build for Samsung Galaxy A03s
- Support Models
  - A037F
  - A037M
  - Others needs to test

### 📝 Features of this Vendor 
- Ril Blobs From Galaxy A04
     - Fixing the following features on OneUI 6+ Ported ROMs
       - VoLTE Feature
       - Unstable SIM Service Cause by VoLTE Crash
- Removed User Data Encryption
- Debloated
- That's all for now
### 📄 Flashing Guide 
- Make sure your Bootloader is unlocked and have a patched Vbmeta
- Make sure you have a Custom Recovery with "fastbootd" Support
- Use Platform-Tools on your PC and connect to your phone
- Use the command
     - fastboot erase vendor
     - fastboot flash vendor [FILE_PATH]
### ⚖️ Use of the Vendor
- You can include it in your ROM
   - Make sure to include Credit with Link to this GitHub Page
- Modification Based on this Vendor is allowed
   - Make sure to include Credit with Link to this GitHub Page

### 🤓 Credits 
- Samsung For the Base Vendor
