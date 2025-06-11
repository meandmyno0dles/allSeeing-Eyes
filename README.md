# allSeeing-Eyes
and in the darkness bind them!!~
# KDE X-Eyes Clone 👁️🔥

A KDE Plasma widget (plasmoid) to find them all~! Built with QML, PyQt, and PyAutoGUI.

![Preview](contents/ui/images/sauron1_cleaned.png)

---

## 📦 Features
- Smooth eye tracking that follows your cursor
- Glowing animation effect when you click
- Python backend launched via QML `QProcess`
- Clean, circular Eye of Sauron graphic
- Full uninstall script for process cleanup

---

## 🛠️ Installation

1. **Install the plasmoid**
   ```bash
   plasmapkg2 -t plasmoid -i kde-xeyes-clone.zip
   ```

2. **To uninstall later**
   ```bash
   bash plasmoid-uninstall.sh
   ```

---

## 🧱 Structure
```
kde-xeyes-clone/
├── metadata.desktop
├── plasmoid-uninstall.sh
├── contents/
│   ├── ui/
│   │   ├── main.qml
│   │   └── images/
│   │       └── sauron1_cleaned.png
│   └── code/
│       └── main.py
```

---

## 🧠 Requirements
- KDE Plasma 5+
- Python 3 with PyQt5 and pyautogui

---

## 💡 Credits
- Concept inspired by the classic `xeyes` Unix toy
- Eye of Sauron image masked and resized for KDE use

---

## 📫 Contact / Contributions
Pull requests welcome! Feel free to fork and expand — try dual eyes, blinking animations, or D-Bus integrations!

---

## Installation

### 🧪 How to Test the KDE X-Eyes Clone Locally

#### ✅ Step 1: Extract the Project
Unzip the plasmoid package:
```bash
unzip kde-xeyes-clone.zip
```

#### ✅ Step 2: Install Dependencies
Make sure you have the required packages:
```bash
sudo apt install plasma-sdk python3-pyqt5 python3-pyautogui
```

#### ✅ Step 3: Install the Plasmoid
From inside the extracted `kde-xeyes-clone/` directory:
```bash
plasmapkg2 -t plasmoid -i .
```

#### ✅ Step 4: Add the Widget
1. Right-click on your KDE desktop or panel
2. Click **"Add Widgets"**
3. Search for **"KDE X-Eyes Clone"**
4. Drag it to the desktop or panel to activate

#### ✅ Step 5: Test Behavior
- Move your mouse — the eye should follow you
- Click — the eye glows briefly

#### 🔁 Update the Plasmoid (After Code Changes)
```bash
plasmapkg2 -t plasmoid -u .
```

#### 🧹 Uninstall if Needed
```bash
bash plasmoid-uninstall.sh

## 🪪 License
GPL v3
