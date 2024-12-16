### **README: Find and Delete Duplicate Files**

---

#### **Script Name**: `delete_duplicate_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies and removes duplicate files in a specified directory based on their checksums. It is useful for freeing up storage by eliminating redundant files while retaining one copy of each unique file.

---

### **Usage**
```bash
./delete_duplicate_files.sh <target_directory>
```

- **`<target_directory>`**: The directory to scan for duplicate files (required).  

---

### **Features**
1. **Checksum-Based Duplication Detection**:
   - Uses `md5sum` to generate unique checksums for each file and identifies duplicates with identical checksums.

2. **Automatic Duplicate Removal**:
   - Deletes all but the first occurrence of each duplicate file.

3. **Safe and Transparent**:
   - Logs the duplicate files detected and actions taken for transparency.

4. **Temporary File Handling**:
   - Utilizes a temporary file to store intermediate data, ensuring minimal impact on the system.

---

### **How It Works**
1. **Generate Checksums**:
   - The script calculates MD5 checksums for all files in the target directory:
     ```bash
     find "$TARGET_DIR" -type f -exec md5sum {} \; > "$TEMP_FILE"
     ```

2. **Identify Duplicates**:
   - Extracts duplicate checksums using `awk`, `sort`, and `uniq`:
     ```bash
     DUPLICATES=$(awk '{print $1}' "$TEMP_FILE" | sort | uniq -d)
     ```

3. **Log Duplicate Files**:
   - For each duplicate checksum, retrieves the list of associated files:
     ```bash
     FILES=($(grep "$checksum" "$TEMP_FILE" | awk '{print $2}'))
     ```

4. **Delete Duplicates**:
   - Retains the first file in the list and deletes the rest:
     ```bash
     for ((i = 1; i < ${#FILES[@]}; i++)); do
         rm -f "${FILES[i]}"
     done
     ```

5. **Cleanup**:
   - Deletes the temporary file used for processing:
     ```bash
     rm -f "$TEMP_FILE"
     ```

---

### **Example Workflow**

#### **Before Running**
Directory structure:
```
/target_directory/
    file1.txt
    file2.txt  (duplicate of file1.txt)
    image1.jpg
    image2.jpg (duplicate of image1.jpg)
```

#### **Command**
```bash
./delete_duplicate_files.sh /target_directory
```

#### **After Running**
- Retains one copy of each duplicate file:
  ```
  /target_directory/
      file1.txt
      image1.jpg
  ```

---

### **Customizing the Script**

#### **Change Hash Algorithm**
Replace `md5sum` with another checksum utility (e.g., `sha256sum`) for improved hash accuracy:
```bash
find "$TARGET_DIR" -type f -exec sha256sum {} \; > "$TEMP_FILE"
```

#### **Log Deleted Files**
Append the names of deleted files to a log file:
```bash
echo "${FILES[i]}" >> deleted_files.log
```

#### **Dry-Run Mode**
Modify the script to list duplicate files without deleting them:
```bash
echo "Would delete duplicate file: ${FILES[i]}"
```

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x delete_duplicate_files.sh
   ```
2. Verify that the target directory exists and contains files.

---

### **Output**
- Logs detected duplicates and deletion actions:
  ```
  Scanning /target_directory for duplicate files...
  Duplicate files detected: /target_directory/file1.txt /target_directory/file2.txt
  Deleting duplicate file: /target_directory/file2.txt
  Duplicate files detected: /target_directory/image1.jpg /target_directory/image2.jpg
  Deleting duplicate file: /target_directory/image2.jpg
  Duplicate file removal complete.
  ```

---

### **Error Handling**
- If the target directory is missing or invalid, the script exits with:
  ```
  Usage: ./delete_duplicate_files.sh <target_directory>
  ```
- Handles edge cases where no duplicates are found by completing silently.

---

### **Limitations**
1. **Checksum Collisions**:
   - Rare, but possible, for different files to produce identical MD5 checksums. Use a stronger algorithm (e.g., SHA-256) for critical applications.
   
2. **File Overwriting**:
   - If duplicate files are in different directories but share the same name, they are handled independently.

3. **Large Directories**:
   - Performance may degrade for directories with a large number of files.

---

### **Future Enhancements**
1. Add an option to **preview duplicates** before deletion.
2. Provide a **safe mode** to move duplicates to a backup directory instead of deleting them.
3. Extend support for detecting duplicate directories, not just files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Effortlessly clean up your file system and reclaim storage space! 🚀