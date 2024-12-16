### **README: Compress and Delete Old Backup Files**

---

#### **Script Name**: `compress_old_backups.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script compresses backup files in a specified directory that are older than a defined number of days. After successful compression, the original uncompressed files are deleted. The compressed files are saved in a designated directory for efficient storage.

---

### **Usage**
```bash
./compress_old_backups.sh [backup_directory] [days]
```

- **`backup_directory`**: Directory containing the backup files to be compressed (optional, defaults to `backups`).  
- **`days`**: Files older than this number of days will be compressed (optional, defaults to `30`).  

---

### **Features**
1. **Compress Old Backups**:
   - Finds files in the backup directory that are older than the specified number of days and compresses them into `.gz` format.

2. **Automated Cleanup**:
   - Deletes the original uncompressed files after successful compression.

3. **Organized Storage**:
   - Saves compressed files in a separate directory named `compressed_backups` for easy access and organization.

4. **Customizable Parameters**:
   - Allows specifying the backup directory and the age threshold in days.

---

### **Example Usages**

#### **Compress Old Backups in Default Directory**
```bash
./compress_old_backups.sh
```
- Compresses files in the default `backups` directory that are older than 30 days.
- Compressed files are stored in `compressed_backups`.

---

#### **Compress Old Backups in a Custom Directory**
```bash
./compress_old_backups.sh /path/to/backup 60
```
- Compresses files in `/path/to/backup` that are older than 60 days.
- Compressed files are saved in `compressed_backups` inside the specified backup directory.

---

### **How It Works**
1. **Create Compressed Directory**:
   - Ensures the `compressed_backups` directory exists by creating it if necessary:
     ```bash
     mkdir -p "$COMPRESSED_DIR"
     ```

2. **Find Old Files**:
   - Uses the `find` command to locate files in the backup directory that are older than the specified number of days:
     ```bash
     find "$BACKUP_DIR" -type f -mtime +$DAYS
     ```

3. **Compress Files**:
   - Compresses each file using `gzip` and saves the output to the `compressed_backups` directory:
     ```bash
     gzip -c "$file" > "$compressed_file"
     ```

4. **Delete Original Files**:
   - Removes the original uncompressed files after successful compression:
     ```bash
     rm -f "$file"
     ```

5. **Log Actions**:
   - Outputs messages to the terminal, indicating the status of compression and cleanup.

---

### **Prerequisites**
1. Ensure the script has execute permissions:
   ```bash
   chmod +x compress_old_backups.sh
   ```
2. Verify that the backup directory exists and contains files to compress.

---

### **Output**
- During execution, the script logs:
  ```
  Compressing backup files in backups older than 30 days...
  Compressing /path/to/file1 to compressed_backups/file1.gz...
  Compression successful. Deleting original file: /path/to/file1
  ```
- Upon completion:
  ```
  Compression and cleanup complete. Compressed files are in compressed_backups.
  ```

---

### **Error Handling**
- Skips files that fail to compress and logs an error message:
  ```
  Failed to compress /path/to/file2
  ```
- Handles cases where no files match the criteria, completing without errors.

---

### **Limitations**
1. **Non-Recursive**:
   - The script does not traverse subdirectories in the backup directory.
   
2. **File Overwriting**:
   - If a file with the same name exists in `compressed_backups`, it will be overwritten.

3. **Compression Only**:
   - Only compresses files; directories are not included in the process.

---

### **Customizations**

#### **Change Compression Format**
Replace `gzip` with another compression utility like `bzip2` or `xz`:
```bash
bzip2 -c "$file" > "$compressed_file.bz2"
```

#### **Recursive Compression**
Include files in subdirectories by modifying the `find` command:
```bash
find "$BACKUP_DIR" -type f -mtime +$DAYS
```

#### **Dry-Run Mode**
Preview files to be compressed without making changes:
```bash
find "$BACKUP_DIR" -type f -mtime +$DAYS
```

---

### **Future Enhancements**
1. Add an **email notification** for completed compression tasks.
2. Implement a **dry-run mode** to preview actions before execution.
3. Add support for **logging compressed files** into a log file.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Save space by automating your backup compression! 🚀