### **README: Backup Specific File Types**

---

#### **Script Name**: `backup_specific_file_types.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script allows you to back up all files of a specific type (identified by their extension) from a specified directory to a backup directory. It is especially useful for organizing and safeguarding files like `.txt`, `.jpg`, or `.log` files.

---

### **Usage**
```bash
./backup_specific_file_types.sh <source_directory> <file_extension> <backup_directory>
```

- **`<source_directory>`**: The directory to search for files (required).  
- **`<file_extension>`**: The file extension of files to back up (required, without the `.`).  
- **`<backup_directory>`**: The destination directory where the files will be copied (required).  

---

### **Example Usages**

#### **Backup All `.txt` Files**
```bash
./backup_specific_file_types.sh /path/to/source txt /path/to/backup
```
- **Source Directory**: `/path/to/source`  
- **File Type**: `.txt`  
- **Backup Directory**: `/path/to/backup`  
- Result: All `.txt` files in `/path/to/source` are copied to `/path/to/backup`.

---

#### **Backup All `.jpg` Files**
```bash
./backup_specific_file_types.sh /path/to/photos jpg /path/to/photo_backup
```
- **Source Directory**: `/path/to/photos`  
- **File Type**: `.jpg`  
- **Backup Directory**: `/path/to/photo_backup`  
- Result: All `.jpg` files in `/path/to/photos` are copied to `/path/to/photo_backup`.

---

### **How It Works**
1. **Create Backup Directory**:
   - Ensures the backup directory exists using `mkdir -p`. If it doesn’t exist, the script creates it.
   
2. **Find Files**:
   - Uses the `find` command to locate all files in the source directory with the specified extension:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
     ```

3. **Copy Files**:
   - Copies each file to the backup directory using `cp`.

4. **Check Success**:
   - Confirms the backup process by checking the exit code of the `find` and `cp` commands.

---

### **Prerequisites**
- Ensure you have **read permissions** for the source directory and **write permissions** for the backup directory.
- Make the script executable:
  ```bash
  chmod +x backup_specific_file_types.sh
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
- If any required arguments are missing, the script displays:
  ```
  Usage: ./backup_specific_file_types.sh <source_directory> <file_extension> <backup_directory>
  ```
- Handles scenarios where the source directory doesn’t exist or there are no matching files, but it does not overwrite existing files in the backup directory.

---

### **Limitations**
1. **Non-Recursive**:
   - The script only searches the top level of the source directory. Modify the `find` command with `-maxdepth` to adjust this behavior.
   
2. **No Overwrite Check**:
   - Existing files in the backup directory with the same name are overwritten without warning.

3. **File Extension Only**:
   - Works strictly based on file extensions. Does not support partial name matches (e.g., `report*`).

---

### **Customizations**
1. **Recursive Search**:
   - Add recursive functionality by removing the `-maxdepth` restriction:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
     ```

2. **Log Backed-Up Files**:
   - Log each file name to a log file:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -exec cp {} "$BACKUP_DIR" \; -exec echo "{} backed up" >> backup.log \;
     ```

3. **Dry Run Option**:
   - Add a dry run mode to preview files before copying:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION"
     ```

---

### **Future Enhancements**
1. Add a **progress indicator** for large numbers of files.
2. Include a **filter for file size** or date modified to back up only recent or small files.
3. Add support for **compressed backups** using `tar`.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Backup smarter, faster, and safer! 🚀