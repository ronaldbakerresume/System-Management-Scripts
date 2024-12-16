### **README: Delete Files Older Than a Specified Number of Days**

---

#### **Script Name**: `delete_old_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script deletes files in a specified directory that are older than a given number of days. It is a convenient solution for maintaining clean and organized directories by automatically removing outdated files.

---

### **Usage**
```bash
./delete_old_files.sh <target_directory> <days>
```

- **`<target_directory>`**: The directory to search for files (required).  
- **`<days>`**: The age threshold in days; files older than this will be deleted (required).  

---

### **Features**
1. **Age-Based Deletion**:
   - Removes files that exceed the specified age threshold (in days).
   
2. **Recursive Cleanup**:
   - Processes all files in the target directory and its subdirectories.

3. **Simple Logging**:
   - Outputs messages to confirm successful deletion or report errors.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both the target directory and age threshold are provided. If not, the script exits with:
     ```
     Usage: ./delete_old_files.sh <target_directory> <days>
     ```

2. **Find Matching Files**:
   - Uses the `find` command with the `-mtime` option to locate files older than the specified number of days:
     ```bash
     find "$TARGET_DIR" -type f -mtime +$DAYS
     ```

3. **Delete Files**:
   - Deletes the matching files using `rm`:
     ```bash
     find "$TARGET_DIR" -type f -mtime +$DAYS -exec rm -f {} \;
     ```

4. **Log Results**:
   - Displays success or error messages to the terminal.

---

### **Example Usages**

#### **1. Delete Files Older Than 30 Days**
```bash
./delete_old_files.sh /path/to/directory 30
```
- Removes files in `/path/to/directory` that have not been modified in the last 30 days.

---

#### **2. Delete Files Older Than 7 Days**
```bash
./delete_old_files.sh /path/to/logs 7
```
- Cleans up old log files in `/path/to/logs` that are more than 7 days old.

---

### **Customizing the Script**

#### **Dry-Run Mode**
Preview the files to be deleted without actually removing them:
```bash
find "$TARGET_DIR" -type f -mtime +$DAYS
```

#### **Limit Deletion to Specific Extensions**
Delete only files with a specific extension (e.g., `.log`):
```bash
find "$TARGET_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;
```

#### **Exclude Certain Files**
Skip specific files or directories during deletion:
```bash
find "$TARGET_DIR" -type f -mtime +$DAYS ! -name "important_file.txt" -exec rm -f {} \;
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x delete_old_files.sh
     ```
2. **Directory Access**:
   - Verify you have read and write permissions for the target directory.

---

### **Output**
- Logs successful deletion of files:
  ```
  Deleting files older than 30 days in /path/to/directory...
  Deletion complete. All files older than 30 days have been removed.
  ```
- On error:
  ```
  An error occurred during the deletion process.
  ```

---

### **Error Handling**
- If no matching files are found, the script completes without errors.
- If invalid arguments are provided, the script exits with a usage message:
  ```
  Usage: ./delete_old_files.sh <target_directory> <days>
  ```

---

### **Limitations**
1. **Non-Recoverable**:
   - Deleted files cannot be recovered. Use with caution in directories containing important data.

2. **Recursive by Default**:
   - Automatically processes subdirectories, which may not always be desired.

3. **Large Directory Performance**:
   - Deleting many files in large directories may take time.

---

### **Future Enhancements**
1. Add an option to **move files to a backup directory** instead of deleting them.
2. Implement **logging to a file** for tracking deleted files.
3. Introduce **interactive mode** to confirm deletions before proceeding.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Keep your directories clean and organized effortlessly! 🚀