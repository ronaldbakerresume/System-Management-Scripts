### **README: Archive Files Older Than Specified Days**

---

#### **Script Name**: `archive_old_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script allows you to archive files from a specified directory that are older than a certain number of days. It generates a `.tar.gz` archive containing these files, which is useful for backups or storage cleanup.

---

### **Usage**
```bash
./archive_old_files.sh <source_directory> <days_old> <archive_name>
```

- **`<source_directory>`**: The directory containing files to be archived (required).  
- **`<days_old>`**: The age threshold in days. Files older than this will be archived (required).  
- **`<archive_name>`**: The name of the output archive file, including the `.tar.gz` extension (required).  

---

### **Example Usages**

#### **Archive Files Older Than 30 Days**
```bash
./archive_old_files.sh /path/to/files 30 old_files_archive.tar.gz
```
- Files older than 30 days in `/path/to/files` will be archived into `old_files_archive.tar.gz`.

---

#### **Archive Files Older Than 7 Days**
```bash
./archive_old_files.sh /var/log 7 logs_backup.tar.gz
```
- All files in `/var/log` older than 7 days will be compressed into `logs_backup.tar.gz`.

---

### **How It Works**
1. **Find Old Files**:
   - The script uses the `find` command with the `-mtime +<days>` flag to identify files older than the specified number of days.
2. **Create Archive**:
   - The `tar -czf` command compresses the identified files into a `.tar.gz` archive.
3. **Output Archive**:
   - The generated archive is saved with the provided name in the current working directory.

---

### **Prerequisites**
- Ensure you have **write permissions** in the directory where the archive will be saved.
- Verify that the **source directory** exists and contains files to archive.
- Make the script executable:
  ```bash
  chmod +x archive_old_files.sh
  ```

---

### **Output**
- If successful, the script displays:
  ```bash
  Archiving complete. Archive saved as <archive_name>.
  ```
- If there’s an error (e.g., missing arguments or write permissions), the script outputs:
  ```bash
  An error occurred during the archiving process.
  ```

---

### **Error Handling**
- If required arguments are missing, the script displays usage instructions:
  ```bash
  Usage: ./archive_old_files.sh <source_directory> <days_old> <archive_name>
  ```
- If the archive creation fails, the script displays an error message.

---

### **Limitations**
- The script does not delete the archived files from the source directory after archiving. This behavior can be added if needed.
- Works only on regular files; directories are not archived.
- Requires sufficient disk space for the resulting archive.

---

### **Future Enhancements**
- Add an option to delete the original files after successful archiving.
- Include a dry-run mode to preview the files that will be archived.
- Allow filtering files by additional criteria, such as size or name pattern.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

Start archiving efficiently today! 🚀