### **README: Organize Files by Extension Script**

---

#### **Script Name**: `organize_by_extension.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script organizes files in the current directory by their extensions. It creates separate directories for each file type and moves the corresponding files into their respective folders. This is a quick and efficient way to declutter and organize files.

---

### **Usage**
```bash
./organize_by_extension.sh
```

- **No arguments required**.  

---

### **Features**
1. **Extension-Based Organization**:
   - Automatically identifies file extensions and groups files into directories.

2. **Directory Creation**:
   - Creates a new directory for each unique extension if it doesn’t already exist.

3. **Safe File Movement**:
   - Moves files without overwriting or losing them.

4. **Dynamic and Scalable**:
   - Handles all file types present in the directory.

---

### **How It Works**
1. **Iterate Over Files**:
   - Loops through all files in the current directory:
     ```bash
     for file in *; do
     ```

2. **Identify File Extensions**:
   - Extracts the extension from each file name:
     ```bash
     extension="${file##*.}"
     ```

3. **Create Directories**:
   - Creates a directory named after the file extension (e.g., `txt`, `jpg`):
     ```bash
     mkdir -p "$extension"
     ```

4. **Move Files**:
   - Moves each file into its corresponding directory:
     ```bash
     mv "$file" "$extension/"
     ```

5. **Completion Message**:
   - Logs a success message for each file moved and outputs a summary at the end.

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
report1.txt
image1.jpg
script.sh
data.csv
```

#### **Run the Script**
```bash
./organize_by_extension.sh
```

#### **After Running the Script**
Directory contents:
```
txt/
    report1.txt
jpg/
    image1.jpg
sh/
    script.sh
csv/
    data.csv
```

---

### **Customizing the Script**

#### **Exclude Certain Files**
To skip specific files (e.g., hidden files or scripts), add a condition:
```bash
if [[ "$file" == "organize_by_extension.sh" ]]; then
    continue
fi
```

#### **Handle Files Without Extensions**
Move files without extensions to a separate directory:
```bash
if [[ "$file" == *.* ]]; then
    extension="${file##*.}"
else
    extension="no_extension"
fi
```

#### **Add Logging**
Save a log of moved files:
```bash
echo "Moved $file to $extension/" >> organize_log.txt
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x organize_by_extension.sh
     ```

2. **Sufficient Space**:
   - Ensure there is enough space to move files within the directory.

---

### **Output**

#### **Sample Terminal Output**:
```
Moved report1.txt to txt/
Moved image1.jpg to jpg/
Moved script.sh to sh/
Moved data.csv to csv/
Files have been organized by their extensions!
```

---

### **Error Handling**
1. **Files with the Same Name**:
   - If files have the same name in different directories, the script will overwrite them when moved. Add a safeguard to rename duplicates:
     ```bash
     mv "$file" "$extension/$(basename "$file" ."$extension")_$(date +%s).$extension"
     ```

2. **Non-File Items**:
   - Skips directories or symbolic links by checking:
     ```bash
     if [ -f "$file" ]; then
     ```

3. **Empty Directory**:
   - If no files are found, the script completes without action.

---

### **Limitations**
1. **Non-Recursive**:
   - Does not organize files in subdirectories. To include subdirectories, modify the loop:
     ```bash
     find . -type f | while read -r file; do
     ```

2. **No Extension Handling**:
   - Files without extensions are not organized unless explicitly handled.

3. **Same Extension, Different Content**:
   - Groups files by extension regardless of their content type (e.g., `.txt` used for both plain text and logs).

---

### **Future Enhancements**
1. Add support for **recursive organization** of subdirectories.
2. Implement **logging and undo functionality** for better traceability.
3. Include a **size summary** for each extension group after organizing.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Organize your files with simplicity and efficiency! 🚀