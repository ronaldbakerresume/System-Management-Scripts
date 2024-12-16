### **README: Organize Files into Folders by Name Script**

---

#### **Script Name**: `organize_by_name.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script organizes files in the current directory by creating folders based on each file's name (excluding its extension) and moving the respective file into its corresponding folder. It’s an efficient way to group files by their names while retaining their extensions.

---

### **Usage**
```bash
./organize_by_name.sh
```

- **No arguments required**.  

---

### **Features**
1. **Name-Based Organization**:
   - Groups files into folders named after the file (excluding extensions).

2. **Automatic Folder Creation**:
   - Creates a new folder for each unique file name.

3. **Safe File Movement**:
   - Ensures files are moved without overwriting or losing them.

4. **Dynamic and Scalable**:
   - Handles any number of files in the current directory.

---

### **How It Works**
1. **Iterate Over Files**:
   - Loops through all files in the current directory:
     ```bash
     for file in *; do
     ```

2. **Check for Regular Files**:
   - Ensures that only regular files (not directories or special files) are processed:
     ```bash
     if [ -f "$file" ]; then
     ```

3. **Extract File Name Without Extension**:
   - Strips the file extension to determine the folder name:
     ```bash
     folder_name="${file%.*}"
     ```

4. **Create Folders**:
   - Creates a folder named after the file (if it doesn't already exist):
     ```bash
     mkdir -p "$folder_name"
     ```

5. **Move Files**:
   - Moves each file into its respective folder:
     ```bash
     mv "$file" "$folder_name"
     ```

6. **Completion Message**:
   - Logs a success message for each file moved and a summary at the end.

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
document.txt
image.jpg
script.sh
data.csv
```

#### **Run the Script**
```bash
./organize_by_name.sh
```

#### **After Running the Script**
Directory contents:
```
document/
    document.txt
image/
    image.jpg
script/
    script.sh
data/
    data.csv
```

---

### **Customizing the Script**

#### **Handle Duplicate Files**
To prevent overwriting if duplicate files exist, rename duplicates before moving:
```bash
mv "$file" "$folder_name/$(basename "$file" ."$extension")_$(date +%s).$extension"
```

#### **Exclude Certain Files**
Add a condition to skip specific files (e.g., hidden files or this script itself):
```bash
if [[ "$file" == "organize_by_name.sh" || "$file" == .* ]]; then
    continue
fi
```

#### **Process Only Specific File Types**
Restrict the script to work on certain file types (e.g., `.txt`):
```bash
if [[ "$file" == *.txt ]]; then
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x organize_by_name.sh
     ```

2. **Sufficient Space**:
   - Ensure there is enough disk space to create folders and move files.

3. **Valid Directory**:
   - Run the script in a directory containing the files to be organized.

---

### **Output**

#### **Sample Terminal Output**:
```
Moved 'document.txt' to folder 'document/'
Moved 'image.jpg' to folder 'image/'
Moved 'script.sh' to folder 'script/'
Moved 'data.csv' to folder 'data/'
All files have been organized into their respective folders!
```

---

### **Error Handling**
1. **Non-File Items**:
   - Skips directories, symbolic links, or special files using:
     ```bash
     if [ -f "$file" ]; then
     ```

2. **Empty Directory**:
   - If no files are found, the script completes without action.

3. **File Name Conflicts**:
   - Overwrites existing files with the same name in the target folder unless modified to prevent it.

---

### **Limitations**
1. **Non-Recursive**:
   - Organizes files only in the current directory. To include subdirectories, modify the loop:
     ```bash
     find . -type f | while read -r file; do
     ```

2. **One File per Folder**:
   - Moves only the file with the same name into the folder, even if other related files exist.

3. **No Extension Handling**:
   - Files without extensions will create folders with their full name.

---

### **Future Enhancements**
1. Add an option to **group related files** into the same folder (e.g., `image.jpg` and `image.png`).
2. Include **recursive folder organization** for subdirectories.
3. Implement a **dry-run mode** to preview changes before applying them.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Organize your files effortlessly and keep your directories neat and tidy! 🚀