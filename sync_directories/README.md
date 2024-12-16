### **README: Synchronize Directories with rsync Script**

---

#### **Script Name**: `sync_directories.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script uses `rsync` to synchronize the contents of a source directory with a destination directory. It ensures that both directories remain identical by copying new or updated files and deleting files that no longer exist in the source directory.

---

### **Usage**
```bash
./sync_directories.sh <source_directory> <destination_directory>
```

- **`<source_directory>`**: The directory containing the original files (required).  
- **`<destination_directory>`**: The directory to synchronize with the source (required).  

---

### **Features**
1. **Two-Way Synchronization**:
   - Copies new and updated files from the source directory to the destination.

2. **File Deletion**:
   - Removes files in the destination directory that are no longer present in the source.

3. **Efficient and Reliable**:
   - Uses `rsync` for fast and incremental synchronization.

4. **Detailed Logging**:
   - Outputs the synchronization process in the terminal, showing copied, updated, and deleted files.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both the source and destination directories are specified; otherwise, exits with a usage message:
     ```bash
     SOURCE_DIR=${1?"Usage: $0 <source_directory> <destination_directory>"}
     DEST_DIR=${2?"Usage: $0 <source_directory> <destination_directory>"}
     ```

2. **Run `rsync`**:
   - Executes the `rsync` command with the following options:
     - `-a`: Archive mode (preserves file permissions, timestamps, symbolic links, etc.).
     - `-v`: Verbose mode (provides detailed output).
     - `--delete`: Deletes files in the destination that no longer exist in the source.
     ```bash
     rsync -av --delete "$SOURCE_DIR"/ "$DEST_DIR"/
     ```

3. **Handle Errors**:
   - Checks the exit status of `rsync` and displays a success or error message:
     ```bash
     if [ $? -eq 0 ]; then
         echo "Synchronization complete."
     else
         echo "An error occurred during synchronization."
     fi
     ```

---

### **Example Workflow**

#### **Before Running the Script**
- **Source Directory** (`/path/to/source`):
  ```
  file1.txt
  file2.jpg
  ```
- **Destination Directory** (`/path/to/destination`):
  ```
  file1.txt
  file3.png
  ```

#### **Run the Script**
```bash
./sync_directories.sh /path/to/source /path/to/destination
```

#### **After Running the Script**
- **Destination Directory** (`/path/to/destination`):
  ```
  file1.txt
  file2.jpg
  ```
  - `file3.png` is deleted because it no longer exists in the source.  
  - `file2.jpg` is copied from the source.

---

### **Customizing the Script**

#### **Exclude Specific Files**
Exclude certain files or directories using the `--exclude` option:
```bash
rsync -av --delete --exclude "*.tmp" --exclude "logs/" "$SOURCE_DIR"/ "$DEST_DIR"/
```

#### **Dry-Run Mode**
Preview the changes without applying them:
```bash
rsync -avn --delete "$SOURCE_DIR"/ "$DEST_DIR"/
```

#### **Enable Logging**
Save synchronization details to a log file:
```bash
rsync -av --delete "$SOURCE_DIR"/ "$DEST_DIR"/ | tee sync_log.txt
```

---

### **Prerequisites**
1. **Install rsync**:
   - Ensure `rsync` is installed. Use the following commands for installation:
     - On Debian/Ubuntu:
       ```bash
       sudo apt install rsync
       ```
     - On Red Hat/CentOS:
       ```bash
       sudo yum install rsync
       ```

2. **Executable Permissions**:
   - Make the script executable:
     ```bash
     chmod +x sync_directories.sh
     ```

3. **Read/Write Permissions**:
   - Ensure the script has read permissions for the source directory and write permissions for the destination directory.

---

### **Output**

#### **Sample Terminal Output**:
```
Synchronizing /path/to/source to /path/to/destination...
sending incremental file list
file2.jpg
deleting file3.png

sent 1.02M bytes  received 124 bytes  2.04M bytes/sec
total size is 1.02M  speedup is 1.00
Synchronization complete.
```

---

### **Error Handling**
1. **Invalid Directories**:
   - If the source or destination directory is invalid, the script exits with:
     ```
     Usage: $0 <source_directory> <destination_directory>
     ```

2. **Permission Denied**:
   - If the script lacks necessary permissions, `rsync` reports the error:
     ```
     rsync: [sender] opendir "/path/to/source" failed: Permission denied (13)
     ```

3. **Partial Synchronization**:
   - If the synchronization is interrupted, re-run the script to resume.

---

### **Limitations**
1. **One-Way Synchronization**:
   - Synchronizes only from the source to the destination. Changes in the destination directory are overwritten or removed.

2. **File Conflicts**:
   - Overwrites files in the destination without confirmation. Use `--ignore-existing` to skip overwriting:
     ```bash
     rsync -av --ignore-existing "$SOURCE_DIR"/ "$DEST_DIR"/
     ```

3. **Large Data Transfers**:
   - For extremely large directories, consider enabling compression (`-z`):
     ```bash
     rsync -avz --delete "$SOURCE_DIR"/ "$DEST_DIR"/
     ```

---

### **Future Enhancements**
1. Add support for **bi-directional synchronization**.
2. Include an **email notification** upon completion or failure.
3. Implement a **summary report** showing files added, updated, and deleted.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Synchronize your directories efficiently with this robust and reliable script! 🚀