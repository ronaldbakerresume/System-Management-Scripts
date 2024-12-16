### **README: Archive Old Files Script**

---

#### **Script Name**: `move_old_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies and moves files from a source directory to an archive directory if they have not been accessed in a specified number of days. It helps declutter active directories while retaining older files in a backup location.

---

### **Usage**
```bash
./move_old_files.sh <source_directory> <days> <archive_directory>
```

- **`<source_directory>`**: The directory containing files to evaluate (required).  
- **`<days>`**: The number of days since last access to qualify a file as "old" (required).  
- **`<archive_directory>`**: The directory where old files will be moved (required).  

---

### **Features**
1. **Automated Archiving**:
   - Moves files not accessed in the last X days to an archive directory.

2. **Archive Directory Creation**:
   - Automatically creates the archive directory if it doesn't exist.

3. **File Preservation**:
   - Ensures older files are retained without deletion, maintaining a clean and accessible structure.

4. **Customizable Parameters**:
   - Allows dynamic configuration of the source directory, access time threshold, and archive directory.

---

### **How It Works**
1. **Input Validation**:
   - Validates that all required arguments are provided:
     ```bash
     SOURCE_DIR=${1?"Usage: $0 <source_directory> <days> <archive_directory>"}
     ```

2. **Create Archive Directory**:
   - Ensures the archive directory exists:
     ```bash
     mkdir -p "$ARCHIVE_DIR"
     ```

3. **Find and Move Old Files**:
   - Uses the `find` command with the `-atime` flag to identify files not accessed in the last X days:
     ```bash
     find "$SOURCE_DIR" -type f -atime +$DAYS -exec mv {} "$ARCHIVE_DIR" \;
     ```

4. **Log Results**:
   - Outputs success or error messages to the terminal.

---

### **Example Usages**

#### **1. Move Files Not Accessed in 30 Days**
```bash
./move_old_files.sh /home/user/documents 30 /home/user/archive
```
- **Source Directory**: `/home/user/documents`  
- **Archive Directory**: `/home/user/archive`  
- **Result**: Files in `/home/user/documents` not accessed in the last 30 days are moved to `/home/user/archive`.

---

#### **2. Move Files from `/var/logs` to `/backup/logs` After 60 Days**
```bash
./move_old_files.sh /var/logs 60 /backup/logs
```
- Moves logs not accessed in 60 days to a backup location.

---

### **Customizing the Script**

#### **Change Access Time Criteria**
Replace `-atime` (access time) with `-mtime` (modification time) to move files based on last modification:
```bash
find "$SOURCE_DIR" -type f -mtime +$DAYS -exec mv {} "$ARCHIVE_DIR" \;
```

#### **Include Subdirectory Handling**
By default, the script handles all files recursively. To limit depth, add the `-maxdepth` flag:
```bash
find "$SOURCE_DIR" -maxdepth 1 -type f -atime +$DAYS -exec mv {} "$ARCHIVE_DIR" \;
```

#### **Dry-Run Mode**
Preview the files that would be moved without actually moving them:
```bash
find "$SOURCE_DIR" -type f -atime +$DAYS
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x move_old_files.sh
     ```

2. **Directory Access**:
   - Verify read/write permissions for the source and archive directories.

---

### **Output**

#### **Success Message**:
```
Moving files not accessed in the last 30 days from /home/user/documents to /home/user/archive...
Files successfully moved to /home/user/archive.
```

#### **Error Message**:
```
An error occurred while moving files.
```

---

### **Error Handling**
1. **Invalid Directories**:
   - If the source directory is invalid or inaccessible, the script exits with:
     ```
     Usage: ./move_old_files.sh <source_directory> <days> <archive_directory>
     ```

2. **File Access Issues**:
   - Files that cannot be moved due to permissions or other issues are skipped, and the script continues processing.

---

### **Limitations**
1. **Access Time Accuracy**:
   - Relies on the accuracy of access time metadata, which may be affected by certain file systems or backup tools.
   
2. **Recursive by Default**:
   - Processes all subdirectories. To exclude them, limit depth with `-maxdepth`.

3. **No Size Filtering**:
   - Does not filter files based on size. To add size criteria, use the `-size` flag:
     ```bash
     find "$SOURCE_DIR" -type f -atime +$DAYS -size +10M -exec mv {} "$ARCHIVE_DIR" \;
     ```

---

### **Future Enhancements**
1. Add an option to **compress files** before archiving to save space.
2. Provide a **summary report** of files moved, including their sizes.
3. Implement **logging** for better traceability of archived files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Automate your file organization with efficiency and ease! 🚀