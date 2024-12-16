### **README: Archive Files Older Than a Specific Number of Days**

---

#### **Script Name**: `archive_old_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies files in the current directory that are older than a specified number of days (default is 7 days) and compresses them into a `.tar.gz` archive. The resulting archive is timestamped with the current date for easy identification.

---

### **Usage**
```bash
./archive_old_files.sh
```

---

### **Features**
1. **File Age Filtering**:
   - Automatically identifies files older than 7 days using the `find` command with the `-mtime` option.

2. **Automated Compression**:
   - Compresses the identified files into a single `.tar.gz` archive.

3. **Timestamped Archive**:
   - Names the archive using the current date for better organization.

4. **Default Settings**:
   - Requires no additional parameters, working seamlessly in the current directory.

---

### **How It Works**
1. **Define Age Threshold**:
   - The script uses `-mtime +DAYS` to locate files older than the specified threshold:
     ```bash
     find . -type f -mtime +$DAYS -print
     ```

2. **Compress Matching Files**:
   - Pipes the list of files to the `tar` command to create a compressed archive:
     ```bash
     tar -czvf "$ARCHIVE_NAME" -T -
     ```

3. **Log Results**:
   - Outputs the progress of the compression process and confirms successful archive creation.

---

### **Example Workflow**

#### **Default Behavior**
- **Input**: Files in the current directory older than 7 days.  
- **Command**:
  ```bash
  ./archive_old_files.sh
  ```
- **Output**: Creates an archive named `old_files_<current_date>.tar.gz` containing files older than 7 days.  

#### **Before Running**
```
file1.txt (10 days old)
file2.jpg (2 days old)
file3.log (15 days old)
```

#### **After Running**
- **Archive Created**:
  ```
  old_files_20231215.tar.gz
  ```
- **Remaining Files**:
  ```
  file2.jpg (2 days old)
  ```

---

### **Customizing the Script**

#### **Change the Age Threshold**
Edit the `DAYS` variable to specify a different threshold:
```bash
DAYS=30
```
- Finds files older than 30 days instead of 7.

#### **Change the Archive Name**
Modify the `ARCHIVE_NAME` variable to create a custom archive name:
```bash
ARCHIVE_NAME="backup_$(date +%Y%m%d).tar.gz"
```
- Creates an archive with the name `backup_<current_date>.tar.gz`.

#### **Target a Different Directory**
To process a directory other than the current one, modify the `find` command:
```bash
find /path/to/target -type f -mtime +$DAYS -print
```

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x archive_old_files.sh
   ```
2. Run the script from the directory containing the files or adjust the `find` command for a different directory.

---

### **Output**
- Displays progress as files are added to the archive:
  ```
  Finding files older than 7 days...
  Compressing file1.txt...
  Compressing file3.log...
  ```
- On completion:
  ```
  Files older than 7 days have been compressed into old_files_20231215.tar.gz!
  ```

---

### **Error Handling**
- If no files match the criteria, the resulting archive will be empty, and `tar` will output:
  ```
  tar: Removing leading `./' from member names
  tar: Exiting with failure status due to previous errors
  ```

---

### **Limitations**
1. **Current Directory Only**:
   - By default, the script processes files in the current directory. To include subdirectories, use:
     ```bash
     find /path/to/target -type f -mtime +$DAYS
     ```

2. **File Overwrite**:
   - If an archive with the same name already exists, it will be overwritten without warning.

3. **Empty Archive**:
   - If no matching files are found, the archive may still be created but will be empty.

---

### **Future Enhancements**
1. Add an option to **delete original files** after archiving.
2. Implement a **dry-run mode** to preview files before compression.
3. Include a **recursive flag** for processing nested directories.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Compress and manage your files efficiently! 🚀