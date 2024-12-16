### **README: Backup Specific File Types from a Directory**

---

#### **Script Name**: `backup_file_types.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script backs up files of a specific type (determined by file extension) from a specified source directory to a designated backup directory. It is a straightforward utility for selective file backups, helping you isolate and safeguard specific file types.

---

### **Usage**
```bash
./backup_file_types.sh <source_directory> <file_extension> <backup_directory>
```

- **`<source_directory>`**: Directory where the script will search for files (required).  
- **`<file_extension>`**: File type to back up, specified without the leading dot (e.g., `txt`, `jpg`) (required).  
- **`<backup_directory>`**: Destination directory where the files will be copied (required).  

---

### **Example Usages**

#### **1. Backup All `.txt` Files**
```bash
./backup_file_types.sh /path/to/source txt /path/to/backup
```
- **Source Directory**: `/path/to/source`  
- **File Extension**: `.txt`  
- **Backup Directory**: `/path/to/backup`  
- Result: All `.txt` files in `/path/to/source` are copied to `/path/to/backup`.

---

#### **2. Backup All `.jpg` Files**
```bash
./backup_file_types.sh /images jpg /backups/photos
```
- **Source Directory**: `/images`  
- **File Extension**: `.jpg`  
- **Backup Directory**: `/backups/photos`  
- Result: All `.jpg` files in `/images` are copied to `/backups/photos`.

---

### **How It Works**
1. **Create Backup Directory**:
   - Ensures the backup directory exists by creating it if necessary using `mkdir -p`.

2. **Find Files**:
   - The `find` command identifies all files in the source directory with the specified extension:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
     ```

3. **Copy Files**:
   - Each matching file is copied to the backup directory using `cp`.

4. **Confirm Success**:
   - Checks the success of the backup process by examining the exit code (`$?`) of the last command.

---

### **Prerequisites**
- Ensure you have **read permissions** for the source directory and **write permissions** for the backup directory.
- Make the script executable:
  ```bash
  chmod +x backup_file_types.sh
  ```

---

### **Output**
- During execution, the script logs:
  ```
  Backing up all *.txt files from /path/to/source to /path/to/backup...
  ```
- On success:
  ```
  Backup complete. Files are saved in /path/to/backup.
  ```
- On failure:
  ```
  An error occurred during the backup.
  ```

---

### **Error Handling**
- Missing Arguments:
  - If any required arguments are omitted, the script displays a usage message:
    ```bash
    Usage: ./backup_file_types.sh <source_directory> <file_extension> <backup_directory>
    ```
- If the source directory doesn’t exist or there are no matching files, the script does not fail but may display no output.

---

### **Limitations**
1. **Non-Recursive Search**:
   - By default, the script only searches the top level of the source directory. Modify the `find` command for recursive functionality.

2. **No Overwrite Warning**:
   - Files with the same name in the backup directory are overwritten without a warning.

3. **Strict File Extension Matching**:
   - Only files matching the exact extension (e.g., `txt`) are backed up.

---

### **Customizations**

#### **Recursive File Search**
To include subdirectories, remove the `-maxdepth` limitation (if it exists):
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
```

#### **Log Copied Files**
Modify the script to log copied files to a `backup.log`:
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -exec cp {} "$BACKUP_DIR" \; -exec echo "{} backed up" >> backup.log \;
```

#### **Dry Run Mode**
Add a dry-run mode to preview files without copying them:
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
```

---

### **Future Enhancements**
1. Add **file size filtering** to back up only files larger or smaller than a specific size.
2. Integrate a **progress bar** for large numbers of files.
3. Enable **compression** of the backup files into an archive (`.tar.gz`).

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Safeguard your important files with precision! 🚀