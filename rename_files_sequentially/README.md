### **README: Rename Files to Sequential Numbers Script**

---

#### **Script Name**: `rename_to_sequential_numbers.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script renames all files in a specified directory to sequential numbers with an optional prefix. The numbering starts from a user-defined index (default: 1), and the original file extensions are preserved.

---

### **Usage**
```bash
./rename_to_sequential_numbers.sh <target_directory> [prefix] [start_index]
```

- **`<target_directory>`**: The directory containing the files to rename (required).  
- **`[prefix]`**: An optional prefix to prepend to the renamed files (default: `"file"`).  
- **`[start_index]`**: The starting number for the sequence (default: `1`).  

---

### **Features**
1. **Sequential Renaming**:
   - Renames files to `prefix_number.extension`, starting from the specified index.

2. **Preserves File Extensions**:
   - Retains the original extensions of the files.

3. **Customizable Naming**:
   - Allows the user to specify a prefix and starting index.

4. **Safe File Handling**:
   - Ensures only regular files are renamed (skips directories and special files).

---

### **How It Works**
1. **Input Validation**:
   - Ensures a target directory is provided; otherwise, exits with a usage message:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Set Defaults for Optional Parameters**:
   - Uses `"file"` as the default prefix and `1` as the default starting index:
     ```bash
     PREFIX=${2:-"file"}
     START_INDEX=${3:-1}
     ```

3. **Iterate Over Files**:
   - Loops through all files in the target directory:
     ```bash
     for file in "$TARGET_DIR"/*; do
     ```

4. **Extract File Extension**:
   - Retrieves the file's extension:
     ```bash
     extension="${file##*.}"
     ```

5. **Rename Files**:
   - Constructs the new file name and renames the file:
     ```bash
     new_name="$TARGET_DIR/${PREFIX}_${counter}.$extension"
     mv "$file" "$new_name"
     ```

6. **Increment Counter**:
   - Increments the counter for the next file:
     ```bash
     ((counter++))
     ```

7. **Log Results**:
   - Outputs the old and new file names during the renaming process.

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
image1.jpg
photo.png
document.pdf
notes.txt
```

#### **Run the Script**
```bash
./rename_to_sequential_numbers.sh /path/to/directory img 100
```

#### **After Running the Script**
Renamed directory contents:
```
img_100.jpg
img_101.png
img_102.pdf
img_103.txt
```

---

### **Customizing the Script**

#### **Change the Separator**
Replace the underscore (`_`) in the file name with a different character:
```bash
new_name="$TARGET_DIR/${PREFIX}-${counter}.$extension"
```

#### **Include Leading Zeros**
Format the numbering with leading zeros for consistent file names:
```bash
new_name="$TARGET_DIR/${PREFIX}_$(printf "%03d" $counter).$extension"
```
- Example output:
  ```
  img_001.jpg
  img_002.png
  ```

#### **Rename Only Specific File Types**
Restrict renaming to certain file types (e.g., `.jpg`):
```bash
if [[ "$file" == *.jpg ]]; then
```

#### **Preview Changes Before Renaming**
Print the proposed changes without renaming:
```bash
echo "Would rename: $file -> $new_name"
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x rename_to_sequential_numbers.sh
     ```

2. **Valid Target Directory**:
   - Verify the target directory exists and contains files.

---

### **Output**

#### **Sample Terminal Output**:
```
Renaming files in /path/to/directory to sequential numbers with prefix 'img'...
Renaming: /path/to/directory/image1.jpg -> /path/to/directory/img_100.jpg
Renaming: /path/to/directory/photo.png -> /path/to/directory/img_101.png
Renaming: /path/to/directory/document.pdf -> /path/to/directory/img_102.pdf
Renaming: /path/to/directory/notes.txt -> /path/to/directory/img_103.txt
File renaming to sequential numbers complete.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the target directory is invalid or inaccessible, the script exits with:
     ```
     Usage: $0 <target_directory>
     ```

2. **Conflicting File Names**:
   - If a file with the same new name already exists, it will overwrite the file. To avoid this, add a safeguard:
     ```bash
     if [ -f "$new_name" ]; then
         new_name="${new_name%.*}_$(date +%s).${extension}"
     fi
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

2. **Special Characters in File Names**:
   - May encounter issues with spaces or special characters in file names. Use quotes to handle them:
     ```bash
     mv "$file" "$new_name"
     ```

---

### **Future Enhancements**
1. Add a **dry-run mode** to preview renaming changes.
2. Include an option to **sort files by size or modification date** before renaming.
3. Add support for **recursive renaming** in subdirectories.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Quickly rename files to organized, sequential names with this script! 🚀