### **README: Delete Files with a Specific Extension**

---

#### **Script Name**: `delete_files_with_extension.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script deletes all files with a specified extension within a given directory. It is useful for cleaning up unwanted or temporary files, such as `.log`, `.tmp`, or `.bak`.

---

### **Usage**
```bash
./delete_files_with_extension.sh <target_directory> <extension>
```

- **`<target_directory>`**: The directory to search for files (required).  
- **`<extension>`**: The file extension to delete (e.g., `log`, `tmp`) (required).  

---

### **Features**
1. **Targeted File Deletion**:
   - Deletes only files with the specified extension, leaving all other files untouched.
   
2. **Safe and Controlled**:
   - Processes files in the specified directory and logs progress for transparency.

3. **Recursive Deletion**:
   - Deletes matching files in the target directory and its subdirectories.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both the target directory and file extension are provided. If not, the script exits with:
     ```
     Usage: ./delete_files_with_extension.sh <target_directory> <extension>
     ```

2. **Find Matching Files**:
   - Uses the `find` command to locate files with the specified extension:
     ```bash
     find "$TARGET_DIR" -type f -name "*.$EXTENSION"
     ```

3. **Delete Files**:
   - Deletes the matching files using the `rm` command:
     ```bash
     find "$TARGET_DIR" -type f -name "*.$EXTENSION" -exec rm -f {} \;
     ```

4. **Log Results**:
   - Displays success or error messages based on the outcome.

---

### **Example Usages**

#### **Delete `.log` Files**
```bash
./delete_files_with_extension.sh /path/to/directory log
```
- Deletes all `.log` files in `/path/to/directory` and its subdirectories.

---

#### **Delete `.tmp` Files**
```bash
./delete_files_with_extension.sh /path/to/directory tmp
```
- Removes temporary files (`.tmp`) from the specified directory.

---

### **Customizing the Script**

#### **Dry-Run Mode**
Preview the files to be deleted without actually removing them:
```bash
find "$TARGET_DIR" -type f -name "*.$EXTENSION"
```

#### **Exclude Specific Directories**
To skip certain directories (e.g., `logs` or `tmp`), modify the `find` command:
```bash
find "$TARGET_DIR" -type f -name "*.$EXTENSION" ! -path "*/logs/*" -exec rm -f {} \;
```

#### **Limit Deletion by Date**
Delete files older than a specific number of days with the `-mtime` option:
```bash
find "$TARGET_DIR" -type f -name "*.$EXTENSION" -mtime +7 -exec rm -f {} \;
```
- Deletes matching files older than 7 days.

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x delete_files_with_extension.sh
     ```
2. **Directory Access**:
   - Verify you have read and write permissions for the target directory.

---

### **Output**
- On success, the script logs:
  ```
  Deleting all *.log files in /path/to/directory...
  Deletion complete. All *.log files have been removed from /path/to/directory.
  ```
- On failure:
  ```
  An error occurred while deleting files.
  ```

---

### **Error Handling**
- If no files with the specified extension exist, the script completes silently without errors.
- If invalid arguments are provided, the script exits with a usage message:
  ```
  Usage: ./delete_files_with_extension.sh <target_directory> <extension>
  ```

---

### **Limitations**
1. **Non-Recoverable**:
   - Deleted files cannot be recovered. Use with caution in directories containing important data.

2. **Wildcard Matching**:
   - Matches files strictly by extension (e.g., `.log`) and ignores files with partial matches (e.g., `logfile.txt`).

3. **Recursive by Default**:
   - The script processes subdirectories automatically, which may not always be desired.

---

### **Future Enhancements**
1. Add an option to **confirm deletion** interactively for each file.
2. Implement a **backup mode** to move files to a temporary location before deletion.
3. Provide a **summary report** of deleted files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Easily clean up your directories with precision! 🚀