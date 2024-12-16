### **README: Automated Project Backup Script**

---

#### **Script Name**: `project_backup.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script automates the process of creating compressed backups of a specified project directory. It ensures all project files are safely archived with a timestamp for easy tracking and organization.  

---

### **Usage**
```bash
./project_backup.sh
```

---

### **Features**
1. **Automatic Directory Backup**:
   - Compresses the project directory (`SOURCE_DIR`) into a `.tar.gz` archive.

2. **Timestamped Backups**:
   - Includes the current date and time in the backup file name for easy versioning.

3. **Customizable Paths**:
   - Modify `SOURCE_DIR` to specify the directory you want to back up.
   - Set `BACKUP_DIR` to the desired location for storing backups.

---

### **Example Usages**

#### **Default Usage**
- **Source Directory**: `$HOME/my_project`  
- **Backup Directory**: `$HOME/backups`

Running the script creates a backup like:
```
$HOME/backups/backup_my_project_20231215_153000.tar.gz
```

#### **Customize Source and Backup Directories**
Edit the script to specify custom directories:
```bash
# Source directory to back up
SOURCE_DIR="/path/to/your/project"

# Destination directory for backups
BACKUP_DIR="/path/to/your/backups"
```
- Back up `/path/to/your/project` to `/path/to/your/backups`.

---

### **How It Works**
1. **Prepare Backup Directory**:
   - Ensures the backup directory exists by creating it if necessary (`mkdir -p`).
   
2. **Generate Timestamped Backup File**:
   - Uses `date` to append a unique timestamp to the backup file name.

3. **Create Compressed Archive**:
   - Archives the source directory using `tar -czvf`.

4. **Confirm Backup Success**:
   - Checks the exit code of the `tar` command and displays success or failure messages.

---

### **Customizing the Script**
1. **Change the Source Directory**:
   - Modify this line to back up a different directory:
     ```bash
     SOURCE_DIR="$HOME/my_project"
     ```

2. **Set a Different Backup Destination**:
   - Update the backup destination here:
     ```bash
     BACKUP_DIR="$HOME/backups"
     ```

3. **Exclude Specific Files/Directories**:
   - Add an `--exclude` flag to the `tar` command to exclude certain files:
     ```bash
     tar -czvf "$BACKUP_FILE" --exclude="$SOURCE_DIR/node_modules" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
     ```

---

### **Log Output**
The script outputs:
1. The path of the created backup file:
   ```
   Backing up /home/user/my_project to /home/user/backups/backup_my_project_20231215_153000.tar.gz...
   ```
2. Success or failure messages:
   ```
   Backup successful!
   ```
   Or:
   ```
   Backup failed!
   ```

---

### **Error Handling**
- The script checks the success of the `tar` command (`$?`) to confirm backup creation.
- If the backup directory is missing, it automatically creates it using `mkdir -p`.

---

### **Limitations**
1. **Hardcoded Paths**:
   - Requires manual editing of `SOURCE_DIR` and `BACKUP_DIR` for custom usage.
2. **No Remote Backups**:
   - Only backs up locally. For remote backups, use tools like `rsync` or SCP.

---

### **Future Enhancements**
1. Add options to pass `SOURCE_DIR` and `BACKUP_DIR` as arguments:
   ```bash
   ./project_backup.sh /path/to/source /path/to/backup
   ```
2. Include email or notification alerts for backup success or failure.
3. Add support for incremental backups using `rsync`.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Start protecting your projects today with seamless backups! 🚀