### **README: Delete Temporary Files Script**

---

#### **Script Name**: `delete_temp_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies and deletes temporary files in a specified directory. It targets files with common temporary file extensions (`.tmp`, `.bak`, `.swp`) and removes them to free up space and declutter directories.

---

### **Usage**
```bash
./delete_temp_files.sh <target_directory>
```

- **`<target_directory>`**: The directory to scan for temporary files (required).  

---

### **Features**
1. **Targeted File Deletion**:
   - Removes files with extensions commonly used for temporary or backup files:
     - `.tmp`: Temporary files.
     - `.bak`: Backup files.
     - `.swp`: Swap files (e.g., Vim).

2. **Automated Cleanup**:
   - Scans the directory and deletes matching files in one command.

3. **Customizable**:
   - Easily extendable to include additional file types.

4. **Safe Operation**:
   - Deletes files based on extensions only, ensuring other files remain untouched.

---

### **How It Works**
1. **Input Validation**:
   - Ensures a target directory is provided; otherwise, exits with a usage message:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Search for Temporary Files**:
   - Uses the `find` command to locate files with specific extensions:
     ```bash
     find "$TARGET_DIR" -type f \( -name "*.tmp" -o -name "*.bak" -o -name "*.swp" \)
     ```

3. **Delete Files**:
   - Deletes each matching file using `rm -f`:
     ```bash
     -exec rm -f {} \;
     ```

4. **Log Results**:
   - Outputs a success message or an error message if the operation fails.

---

### **Example Workflow**

#### **1. Delete Temporary Files from `/home/user/downloads`**
```bash
./delete_temp_files.sh /home/user/downloads
```

#### **Before Running the Script**
Directory contents:
```
file1.tmp
backup.bak
image.jpg
notes.swp
document.pdf
```

#### **After Running the Script**
Directory contents:
```
image.jpg
document.pdf
```

Terminal output:
```
Searching for temporary files in /home/user/downloads and removing them...
Temporary files have been successfully removed from /home/user/downloads.
```

---

### **Customizing the Script**

#### **Add More Temporary File Types**
Extend the `find` command to include additional file extensions:
```bash
find "$TARGET_DIR" -type f \( -name "*.tmp" -o -name "*.bak" -o -name "*.swp" -o -name "*.log" -o -name "*.old" \) -exec rm -f {} \;
```

#### **Exclude Specific Files**
To avoid deleting certain files, add an exclusion filter using `!`:
```bash
find "$TARGET_DIR" -type f ! -name "important.bak" \( -name "*.tmp" -o -name "*.bak" -o -name "*.swp" \) -exec rm -f {} \;
```

#### **Dry-Run Mode**
Preview the files that would be deleted without actually removing them:
```bash
find "$TARGET_DIR" -type f \( -name "*.tmp" -o -name "*.bak" -o -name "*.swp" \)
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x delete_temp_files.sh
     ```

2. **Valid Target Directory**:
   - Verify the target directory exists and contains temporary files.

---

### **Output**

#### **Success Message**:
```
Searching for temporary files in /path/to/directory and removing them...
Temporary files have been successfully removed from /path/to/directory.
```

#### **Error Message**:
```
An error occurred while deleting temporary files.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the target directory does not exist or is inaccessible, the script exits with:
     ```
     Usage: ./delete_temp_files.sh <target_directory>
     ```

2. **No Matching Files**:
   - If no temporary files are found, the script completes without errors but does not log a success message for deletion.

3. **Permission Issues**:
   - If the script lacks permissions to delete certain files, those files are skipped.

---

### **Limitations**
1. **Extension-Based Deletion**:
   - Relies solely on file extensions to identify temporary files. Files without standard extensions are not deleted.

2. **Non-Recursive by Default**:
   - Deletes files only in the specified directory. To include subdirectories, remove the `-maxdepth` flag (if added).

---

### **Future Enhancements**
1. Add a **summary report** showing the total number of files deleted and the space reclaimed.
2. Implement **recursive cleanup** for subdirectories.
3. Include a **confirmation prompt** for user verification before deletion.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Declutter your directories effortlessly by removing unnecessary temporary files! 🚀