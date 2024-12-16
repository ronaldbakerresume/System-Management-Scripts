### **README: Rename Files by Modification Date Script**

---

#### **Script Name**: `rename_by_modification_date.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script renames files in a specified directory based on their last modification date. Each file is renamed in the format `YYYY-MM-DD.extension`, where the date corresponds to the file's modification date.

---

### **Usage**
```bash
./rename_by_modification_date.sh <target_directory>
```

- **`<target_directory>`**: The directory containing the files to rename (required).  

---

### **Features**
1. **Date-Based Renaming**:
   - Automatically renames files using their last modification date.

2. **Preserves File Extensions**:
   - Retains the original file extension in the renamed files.

3. **Safe File Handling**:
   - Ensures only regular files are renamed (skips directories and special files).

4. **Dynamic and Scalable**:
   - Processes all files in the specified directory, regardless of the number.

---

### **How It Works**
1. **Input Validation**:
   - Ensures a target directory is specified; otherwise, exits with a usage message:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Iterate Over Files**:
   - Loops through all files in the target directory:
     ```bash
     for file in "$TARGET_DIR"/*; do
         if [ -f "$file" ]; then
     ```

3. **Extract Modification Date**:
   - Retrieves the file's modification date in `YYYY-MM-DD` format:
     ```bash
     mod_date=$(date -r "$file" "+%Y-%m-%d")
     ```

4. **Rename Files**:
   - Combines the modification date with the file extension to generate the new name:
     ```bash
     new_name="$TARGET_DIR/$mod_date.$extension"
     mv "$file" "$new_name"
     ```

5. **Log Renaming**:
   - Outputs the old and new file names during the renaming process:
     ```bash
     echo "Renaming: $file -> $new_name"
     ```

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
report.docx  (modified on 2023-12-01)
image.png    (modified on 2023-11-28)
notes.txt    (modified on 2023-12-05)
```

#### **Run the Script**
```bash
./rename_by_modification_date.sh /path/to/directory
```

#### **After Running the Script**
Renamed directory contents:
```
2023-12-01.docx
2023-11-28.png
2023-12-05.txt
```

---

### **Customizing the Script**

#### **Add a Prefix or Suffix**
Include additional text in the renamed files (e.g., prefix `file_`):
```bash
new_name="$TARGET_DIR/file_${mod_date}.$extension"
```

#### **Rename Only Specific File Types**
Restrict the renaming process to certain file types (e.g., `.txt`):
```bash
if [[ "$file" == *.txt ]]; then
```

#### **Preview Changes Before Renaming**
Print the proposed changes without applying them:
```bash
echo "Would rename: $file -> $new_name"
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x rename_by_modification_date.sh
     ```

2. **Valid Target Directory**:
   - Verify the target directory exists and contains files.

3. **Date Command**:
   - Uses the `date` command, which is available in most Linux distributions.

---

### **Output**

#### **Sample Terminal Output**:
```
Renaming files in /path/to/directory based on their modification date...
Renaming: /path/to/directory/report.docx -> /path/to/directory/2023-12-01.docx
Renaming: /path/to/directory/image.png -> /path/to/directory/2023-11-28.png
Renaming: /path/to/directory/notes.txt -> /path/to/directory/2023-12-05.txt
File renaming based on modification date complete.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the target directory is invalid or inaccessible, the script exits with:
     ```
     Usage: $0 <target_directory>
     ```

2. **Conflicting File Names**:
   - If multiple files have the same modification date and extension, they will overwrite each other. To avoid this, add a unique identifier:
     ```bash
     new_name="$TARGET_DIR/${mod_date}_$(basename "$file").$extension"
     ```

3. **No Files in Directory**:
   - If the directory contains no files, the script completes without renaming anything.

---

### **Limitations**
1. **Non-Recursive**:
   - Processes only files in the specified directory. To include subdirectories, use:
     ```bash
     find "$TARGET_DIR" -type f | while read -r file; do
     ```

2. **Duplicate Dates**:
   - Files with the same modification date and extension will result in overwriting unless customized.

3. **Special Characters in File Names**:
   - May encounter issues with spaces or special characters in file names. Use quotes to handle them:
     ```bash
     mv "$file" "$new_name"
     ```

---

### **Future Enhancements**
1. Add support for **recursive renaming** in subdirectories.
2. Include a **dry-run mode** to preview renaming changes.
3. Provide a **summary report** of renamed files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Organize your files with clarity by renaming them based on modification dates! 🚀