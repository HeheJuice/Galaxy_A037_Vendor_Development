<h1 align="center">
  <img loading="lazy" src="BannerA03s.png"/>
</h1>

### 🗺️ Galaxy A03s Vendor Development
- Custom Vendor With Basic Modification for Samsung Galaxy A03s
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

> [!IMPORTANT]
> * `Get notified yourself that I am not responsible for bricked devices, dead SD cards, thermonuclear war, or you getting fired because the alarm app failed.`
> * `Please do some research if you have any concerns about features included in this Vendor before flashing it!`
> * `YOU are choosing to make these modifications,and if you point the finger at me for messing up your device,I will laugh at you.`

- Make sure your Bootloader is unlocked and have a patched Vbmeta
- Make sure you have a Custom Recovery with "fastbootd" Support
- Basic Android and Window Knowledge Required 
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
