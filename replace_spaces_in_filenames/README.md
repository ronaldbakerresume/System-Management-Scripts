### **README: Replace Spaces in File Names Script**

---

#### **Script Name**: `replace_spaces_with_underscores.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script replaces all spaces in file names within a specified directory with underscores (`_`). It ensures that file names are system-friendly and easier to use in scripts or command-line operations.

---

### **Usage**
```bash
./replace_spaces_with_underscores.sh <target_directory>
```

- **`<target_directory>`**: The directory containing the files to rename (required).  

---

### **Features**
1. **Space-to-Underscore Conversion**:
   - Identifies spaces in file names and replaces them with underscores.

2. **Safe Renaming**:
   - Ensures only regular files are renamed, avoiding directories or special files.

3. **Dynamic Handling**:
   - Processes all files in the specified directory, regardless of number or type.

4. **Log Renaming Activity**:
   - Logs old and new file names for transparency during the renaming process.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is specified; otherwise, exits with a usage message:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Iterate Over Files**:
   - Loops through all files in the target directory:
     ```bash
     for file in "$TARGET_DIR"/*; do
         if [ -f "$file" ]; then
     ```

3. **Replace Spaces**:
   - Uses the `sed` command to replace spaces in the file name with underscores:
     ```bash
     new_name=$(echo "$file" | sed 's/ /_/g')
     ```

4. **Rename Files**:
   - Renames the file only if the new name is different:
     ```bash
     if [ "$file" != "$new_name" ]; then
         mv "$file" "$new_name"
         echo "Renamed: $file -> $new_name"
     fi
     ```

5. **Completion Message**:
   - Logs a success message after processing all files:
     ```bash
     echo "File name modification complete. Spaces have been replaced with underscores."
     ```

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
My File.txt
Another Document.docx
Image File.png
```

#### **Run the Script**
```bash
./replace_spaces_with_underscores.sh /path/to/directory
```

#### **After Running the Script**
Renamed directory contents:
```
My_File.txt
Another_Document.docx
Image_File.png
```

---

### **Customizing the Script**

#### **Handle Other Special Characters**
To replace additional characters (e.g., `-` or `&`), modify the `sed` command:
```bash
new_name=$(echo "$file" | sed 's/ /_/g; s/-/_/g; s/&/_/g')
```

#### **Recursive Renaming**
To process files in subdirectories, replace the loop with `find`:
```bash
find "$TARGET_DIR" -type f | while read -r file; do
    new_name=$(echo "$file" | sed 's/ /_/g')
    if [ "$file" != "$new_name" ]; then
        mv "$file" "$new_name"
        echo "Renamed: $file -> $new_name"
    fi
done
```

#### **Dry-Run Mode**
Preview the changes without applying them:
```bash
echo "Would rename: $file -> $new_name"
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x replace_spaces_with_underscores.sh
     ```

2. **Valid Target Directory**:
   - Verify the target directory exists and contains files.

3. **Dependencies**:
   - Relies on standard tools (`sed`, `mv`), which are available in most Linux distributions.

---

### **Output**

#### **Sample Terminal Output**:
```
Replacing spaces in file names with underscores in /path/to/directory...
Renamed: /path/to/directory/My File.txt -> /path/to/directory/My_File.txt
Renamed: /path/to/directory/Another Document.docx -> /path/to/directory/Another_Document.docx
Renamed: /path/to/directory/Image File.png -> /path/to/directory/Image_File.png
File name modification complete. Spaces have been replaced with underscores.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the target directory is invalid or inaccessible, the script exits with:
     ```
     Usage: $0 <target_directory>
     ```

2. **Conflicting File Names**:
   - If a renamed file already exists, it will overwrite the existing file. To avoid this, add a safeguard:
     ```bash
     if [ -f "$new_name" ]; then
         new_name="${new_name%.*}_$(date +%s).${new_name##*.}"
     fi
     ```

3. **No Files in Directory**:
   - If no files are found, the script completes without renaming anything.

---

### **Limitations**
1. **Non-Recursive**:
   - Processes only files in the specified directory. Use the recursive example to include subdirectories.

2. **Special Characters in File Names**:
   - May encounter issues with files containing unusual characters. Wrap variables in quotes to handle them:
     ```bash
     mv "$file" "$new_name"
     ```

---

### **Future Enhancements**
1. Add support for **recursive renaming** in subdirectories.
2. Implement a **dry-run mode** for safer execution.
3. Provide a **summary report** of renamed files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Effortlessly clean up file names by replacing spaces with underscores! 🚀