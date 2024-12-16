### **README: Daily Backup Folder Script**

---

#### **Script Name**: `daily_backup.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script creates a backup folder named with the current date and copies all files from a specified source directory into it. The backup folder is stored in a root directory, which defaults to `$HOME/daily_backups`. This ensures a daily snapshot of your important files is securely stored.

---

### **Usage**
```bash
./daily_backup.sh <source_directory> [backup_root]
```

- **`<source_directory>`**: The directory containing the files to back up (required).  
- **`[backup_root]`**: The root directory where daily backups will be stored (optional, defaults to `$HOME/daily_backups`).  

---

### **Features**
1. **Automated Daily Backups**:
   - Creates a new backup folder each day, named with the current date.

2. **Default Backup Location**:
   - Saves backups in `$HOME/daily_backups` by default, or a custom location if provided.

3. **File Copying**:
   - Copies all files and subdirectories from the source directory to the daily backup folder.

4. **Simple Configuration**:
   - Requires minimal setup and works with default settings out of the box.

---

### **Example Usages**

#### **1. Default Backup Location**
```bash
./daily_backup.sh /path/to/source
```
- **Source Directory**: `/path/to/source`  
- **Backup Location**: `$HOME/daily_backups/<current_date>`  
- Example Backup Folder:
  ```
  /home/user/daily_backups/2023-12-15
  ```

---

#### **2. Custom Backup Root**
```bash
./daily_backup.sh /path/to/source /path/to/custom_backups
```
- **Source Directory**: `/path/to/source`  
- **Backup Location**: `/path/to/custom_backups/<current_date>`  
- Example Backup Folder:
  ```
  /path/to/custom_backups/2023-12-15
  ```

---

### **How It Works**
1. **Create a Timestamped Backup Folder**:
   - Generates a folder name based on the current date:
     ```bash
     DATE=$(date "+%Y-%m-%d")
     BACKUP_DIR="$BACKUP_ROOT/$DATE"
     mkdir -p "$BACKUP_DIR"
     ```

2. **Copy Files**:
   - Copies all files and subdirectories from the source directory into the backup folder:
     ```bash
     cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"/
     ```

3. **Log Progress**:
   - Displays messages to indicate success or failure.

---

### **Customizing the Script**

#### **Change the Date Format**
Modify the `DATE` variable to use a different format:
```bash
DATE=$(date "+%d-%m-%Y")
```
- Backup Folder Example:
  ```
  /path/to/backups/15-12-2023
  ```

#### **Exclude Certain Files**
Exclude specific files or patterns during the copy:
```bash
rsync -av --exclude="*.tmp" "$SOURCE_DIR/" "$BACKUP_DIR/"
```

#### **Limit Retention**
Add a retention policy to delete backups older than a certain number of days:
```bash
find "$BACKUP_ROOT" -type d -mtime +30 -exec rm -rf {} \;
```
- Deletes backups older than 30 days.

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x daily_backup.sh
   ```
2. Verify that the source directory exists and contains files to back up.

---

### **Output**
- During execution, the script logs:
  ```
  Backing up files from /path/to/source to /home/user/daily_backups/2023-12-15...
  ```
- On success:
  ```
  Backup complete. Files are saved in /home/user/daily_backups/2023-12-15.
  ```
- On failure:
  ```
  An error occurred during the backup.
  ```

---

### **Error Handling**
- If the source directory is missing or empty, the script may fail during the `cp` operation.
- Directory creation errors (e.g., insufficient permissions) are logged, and the script halts.

---

### **Limitations**
1. **No Compression**:
   - Files are copied as-is without compression. For compressed backups, use `tar` or `zip`.
2. **File Overwriting**:
   - Existing files in the backup directory with the same name will be overwritten.
3. **Non-Recursive Log**:
   - Subdirectories are copied, but their contents are not logged individually.

---

### **Future Enhancements**
1. Add **compression support** for the backup folder (e.g., `.tar.gz`).
2. Implement an **email notification** on backup completion.
3. Introduce **logging to a file** to track backup history.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Safeguard your files with daily backups made easy! 🚀