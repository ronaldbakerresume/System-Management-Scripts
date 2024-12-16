### **README: Find and Delete Empty Directories**

---

#### **Script Name**: `delete_empty_directories.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies and removes empty directories within a specified target directory. It is a simple and effective tool for cleaning up unused directories, keeping your file system organized.

---

### **Usage**
```bash
./delete_empty_directories.sh <target_directory>
```

- **`<target_directory>`**: The directory to scan for empty subdirectories (required).  

---

### **Features**
1. **Identify Empty Directories**:
   - Scans the target directory recursively to locate directories that contain no files or subdirectories.
   
2. **Automatic Cleanup**:
   - Deletes all identified empty directories.

3. **Simple Logging**:
   - Outputs messages indicating the status of the cleanup operation.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is provided. If not, the script exits with:
     ```
     Usage: ./delete_empty_directories.sh <target_directory>
     ```

2. **Search for Empty Directories**:
   - Uses the `find` command with the `-type d` and `-empty` options to locate empty directories:
     ```bash
     find "$TARGET_DIR" -type d -empty
     ```

3. **Remove Empty Directories**:
   - Automatically deletes each empty directory using the `rmdir` command:
     ```bash
     find "$TARGET_DIR" -type d -empty -exec rmdir {} \;
     ```

4. **Log Results**:
   - Logs a success or error message based on the outcome of the operation.

---

### **Example Workflow**

#### **Before Running**
Directory structure:
```
/target_directory/
    dir1/
        file1.txt
    dir2/  (empty)
    dir3/
        subdir1/  (empty)
        subdir2/
            file2.txt
```

#### **Command**
```bash
./delete_empty_directories.sh /target_directory
```

#### **After Running**
Directory structure:
```
/target_directory/
    dir1/
        file1.txt
    dir3/
        subdir2/
            file2.txt
```
- Removed directories:
  - `/target_directory/dir2/`
  - `/target_directory/dir3/subdir1/`

---

### **Customizing the Script**

#### **Dry-Run Mode**
Preview the empty directories without deleting them:
```bash
find "$TARGET_DIR" -type d -empty
```

#### **Log Deleted Directories**
Save the names of deleted directories to a log file:
```bash
find "$TARGET_DIR" -type d -empty -exec rmdir {} \; -exec echo "Removed: {}" >> deleted_dirs.log \;
```

#### **Include Protected Directories**
If you want to exclude specific directories (e.g., `.git`), modify the `find` command:
```bash
find "$TARGET_DIR" -type d -empty ! -path "*/.git/*" -exec rmdir {} \;
```

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x delete_empty_directories.sh
   ```
2. Verify that the target directory exists and contains empty directories.

---

### **Output**
- Logs success messages for deleted directories:
  ```
  Searching for empty directories in /target_directory...
  Empty directories successfully removed from /target_directory.
  ```
- On failure:
  ```
  An error occurred while removing empty directories.
  ```

---

### **Error Handling**
- If the target directory is missing or invalid, the script exits with:
  ```
  Usage: ./delete_empty_directories.sh <target_directory>
  ```
- Skips directories that cannot be removed due to insufficient permissions.

---

### **Limitations**
1. **Non-Recursive Deletion**:
   - Deletes only directories explicitly marked as empty. If a directory becomes empty after its subdirectories are removed, it will require a second pass to delete.

2. **Permission Issues**:
   - Requires write permissions for the target directory and its subdirectories to remove them.

---

### **Future Enhancements**
1. Add a **recursive mode** to handle directories that become empty after their subdirectories are removed.
2. Implement **logging functionality** to keep a record of deleted directories.
3. Add support for excluding specific directories (e.g., `.git` or `node_modules`).

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Keep your directory structure clean and efficient with ease! 🚀