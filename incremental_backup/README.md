### **README: Incremental Backups Using rsync**

---

#### **Script Name**: `incremental_backup.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script creates efficient incremental backups using the `rsync` tool. Each backup is stored as a snapshot, leveraging hard links to avoid duplicating unchanged files, saving disk space while ensuring a complete backup for each run.

---

### **Usage**
```bash
./incremental_backup.sh <source_directory> <backup_directory>
```

- **`<source_directory>`**: The directory containing the files to back up (required).  
- **`<backup_directory>`**: The destination directory where backups will be stored (required).  

---

### **Features**
1. **Incremental Backups**:
   - Uses `rsync` with hard links (`--link-dest`) to avoid re-copying unchanged files.

2. **Snapshot Organization**:
   - Each backup is saved in a timestamped folder (e.g., `snapshot_2023-12-15_14-30-00`).

3. **Latest Snapshot Symlink**:
   - Updates a `latest` symlink to always point to the most recent snapshot.

4. **Space Efficiency**:
   - Hard links allow multiple backups without duplicating unchanged files.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both source and backup directories are specified. If not, the script exits with:
     ```
     Usage: ./incremental_backup.sh <source_directory> <backup_directory>
     ```

2. **Create Snapshot Directory**:
   - Generates a timestamped directory for the new snapshot:
     ```bash
     DATE=$(date "+%Y-%m-%d_%H-%M-%S")
     SNAPSHOT_DIR="$BACKUP_DIR/snapshot_$DATE"
     ```

3. **Perform Incremental Backup**:
   - Uses `rsync` with the `--link-dest` option to compare the current backup with the latest snapshot:
     ```bash
     rsync -a --link-dest="$BACKUP_DIR/latest" "$SOURCE_DIR"/ "$SNAPSHOT_DIR"/
     ```

4. **Update Latest Symlink**:
   - Updates the `latest` symlink to point to the new snapshot:
     ```bash
     ln -sfn "$SNAPSHOT_DIR" "$BACKUP_DIR/latest"
     ```

5. **Log Results**:
   - Outputs success or error messages to the terminal.

---

### **Example Usages**

#### **1. Backup User Documents**
```bash
./incremental_backup.sh /home/user/documents /backup/documents
```
- **Source Directory**: `/home/user/documents`  
- **Backup Directory**: `/backup/documents`  
- **Result**:
  - Creates a snapshot in `/backup/documents/snapshot_<timestamp>`.
  - Updates `/backup/documents/latest` to point to the new snapshot.

---

### **Customizing the Script**

#### **Change Snapshot Naming**
Modify the snapshot directory name to include a custom prefix:
```bash
SNAPSHOT_DIR="$BACKUP_DIR/backup_$DATE"
```

#### **Add Exclusions**
Exclude specific files or directories (e.g., temporary or large files) by adding an `--exclude` option to `rsync`:
```bash
rsync -a --link-dest="$BACKUP_DIR/latest" --exclude="*.tmp" --exclude="cache/" "$SOURCE_DIR"/ "$SNAPSHOT_DIR"/
```

#### **Limit Snapshot Retention**
Automatically delete old snapshots to manage disk space:
```bash
find "$BACKUP_DIR" -type d -name "snapshot_*" -mtime +30 -exec rm -rf {} \;
```
- Removes snapshots older than 30 days.

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x incremental_backup.sh
     ```

2. **Directory Access**:
   - Verify read/write permissions for both the source and backup directories.

3. **rsync**:
   - Ensure `rsync` is installed. It is typically included in most Linux distributions:
     ```bash
     sudo apt install rsync  # Debian/Ubuntu
     sudo yum install rsync  # Red Hat/CentOS
     ```

---

### **Output**
- On success:
  ```
  Performing incremental backup from /home/user/documents to /backup/documents/snapshot_2023-12-15_14-30-00...
  Backup complete. Snapshot saved in /backup/documents/snapshot_2023-12-15_14-30-00.
  ```
- On failure:
  ```
  An error occurred during the backup.
  ```

---

### **Error Handling**
- If `rsync` encounters an error, the script logs the error and does not update the `latest` symlink.
- If the `latest` symlink is missing, the script performs a full backup instead of an incremental backup.

---

### **Limitations**
1. **File System Support**:
   - Hard links require a file system that supports them (e.g., ext4, NTFS). Cross-filesystem backups may not work correctly.

2. **Large Directories**:
   - Backing up large directories may take time, especially during the initial run.

3. **Symlink Management**:
   - Errors in symlink updates may cause issues with incremental backups.

---

### **Future Enhancements**
1. Add **logging to a file** for backup history tracking.
2. Include an **email notification** upon backup completion or failure.
3. Implement a **progress bar** for large backups using `rsync --progress`.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Automate your backups with efficiency and reliability! 🚀