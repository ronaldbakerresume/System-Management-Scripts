### **README: Monitor Directory for New Files Script**

---

#### **Script Name**: `monitor_new_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script monitors a specified directory for newly created files using `inotifywait`. When a new file is detected, its name and timestamp are logged to a file. This is ideal for keeping track of changes in critical directories or automating workflows triggered by file creation.

---

### **Usage**
```bash
./monitor_new_files.sh <target_directory> [log_file]
```

- **`<target_directory>`**: The directory to monitor for new files (required).  
- **`[log_file]`**: The file to log detected changes to (optional). Defaults to `new_files_log.txt`.  

---

### **Features**
1. **Real-Time Monitoring**:
   - Continuously watches a directory for newly created files.

2. **Event Logging**:
   - Logs each new file's name and creation timestamp to the specified log file.

3. **Customizable Output**:
   - Allows specifying a custom log file name.

4. **Simple and Efficient**:
   - Uses `inotifywait` for minimal resource consumption and fast detection.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is provided:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Monitor Directory**:
   - Uses `inotifywait` to watch the directory for `create` events:
     ```bash
     inotifywait -m -e create "$TARGET_DIR" --format '%w%f'
     ```

3. **Log Detected Changes**:
   - Logs the new file's full path and creation timestamp to the specified log file:
     ```bash
     echo "$(date): New file detected - $new_file" | tee -a "$LOG_FILE"
     ```

4. **Repeat**:
   - Continuously listens for new file creation events.

---

### **Example Usages**

#### **1. Monitor the `/uploads` Directory**
```bash
./monitor_new_files.sh /uploads
```
- Monitors `/uploads` for new files.  
- Logs events to the default `new_files_log.txt` file.

---

#### **2. Monitor `/tmp` and Log to `tmp_log.txt`**
```bash
./monitor_new_files.sh /tmp tmp_log.txt
```
- Monitors `/tmp` for new files.  
- Logs events to `tmp_log.txt`.

---

### **Customizing the Script**

#### **Monitor Multiple Events**
Track additional events like file modifications or deletions:
```bash
inotifywait -m -e create,modify,delete "$TARGET_DIR" --format '%w%f'
```

#### **Change Log Format**
Include additional details like file permissions or owner:
```bash
ls -l "$new_file" >> "$LOG_FILE"
```

#### **Limit Monitoring Depth**
Exclude subdirectories by adding `--exclude` or `--excludei` options:
```bash
inotifywait -m -e create --exclude '^.+/subdir/' "$TARGET_DIR" --format '%w%f'
```

---

### **Prerequisites**
1. **Install inotify-tools**:
   - This script relies on `inotifywait`, part of the `inotify-tools` package. Install it using:
     ```bash
     sudo apt install inotify-tools  # Debian/Ubuntu
     sudo yum install inotify-tools  # Red Hat/CentOS
     ```

2. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x monitor_new_files.sh
     ```

3. **Directory Access**:
   - Verify the script has read permissions for the target directory.

---

### **Output**

#### **Terminal Example**:
```
Monitoring /uploads for new files...
Log of new files will be saved to new_files_log.txt.
2023-12-15 10:45:00: New file detected - /uploads/file1.txt
2023-12-15 10:45:05: New file detected - /uploads/image.png
```

#### **Log File (`new_files_log.txt`)**:
```
2023-12-15 10:45:00: New file detected - /uploads/file1.txt
2023-12-15 10:45:05: New file detected - /uploads/image.png
```

---

### **Error Handling**
1. **Missing inotifywait**:
   - If `inotifywait` is not installed, the script will fail with:
     ```
     ./monitor_new_files.sh: line X: inotifywait: command not found
     ```
   - Install `inotify-tools` to resolve this.

2. **Invalid Directory**:
   - If the target directory does not exist, the script exits with:
     ```
     Usage: ./monitor_new_files.sh <target_directory>
     ```

3. **Permissions**:
   - Ensure the script has permissions to read the target directory and write to the log file.

---

### **Limitations**
1. **Local Monitoring Only**:
   - Monitors local directories only. To monitor remote directories, use network tools like `rsync` or SSH.

2. **No Historical Data**:
   - Only detects events that occur while the script is running.

3. **File Creation Only**:
   - By default, tracks only file creation events. To include modifications or deletions, customize the event flags.

---

### **Future Enhancements**
1. Add support for **email or SMS notifications** when new files are detected.
2. Implement a **summary report** showing the total number of new files detected.
3. Add **directory size monitoring** to prevent overuse of disk space.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Easily monitor directories for new files with this efficient script! 🚀