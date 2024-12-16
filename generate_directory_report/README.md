### **README: Generate Detailed Directory Report**

---

#### **Script Name**: `generate_directory_report.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script generates a comprehensive report of all files and subdirectories within a specified directory. The report includes details such as file size and last modified time, providing an organized view of directory contents.

---

### **Usage**
```bash
./generate_directory_report.sh <target_directory> [output_file]
```

- **`<target_directory>`**: The directory to analyze (required).  
- **`[output_file]`**: The file to save the report to (optional, defaults to `directory_report.txt`).  

---

### **Features**
1. **Detailed Reporting**:
   - Includes information on file size and last modified date for each file.
   
2. **Customizable Output**:
   - Allows specifying a custom output file name.

3. **Directory and File Classification**:
   - Separately lists directories and files for clarity.

4. **Timestamped Report**:
   - Adds the generation date and time to the report header.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is specified. If not, the script exits with:
     ```
     Usage: ./generate_directory_report.sh <target_directory>
     ```

2. **Report Initialization**:
   - Creates a report file with a header containing the directory name and generation timestamp:
     ```bash
     echo "Directory Report for $TARGET_DIR" > "$OUTPUT_FILE"
     echo "Generated on: $(date)" >> "$OUTPUT_FILE"
     echo "-------------------------------------" >> "$OUTPUT_FILE"
     ```

3. **Iterate Through Directory Contents**:
   - Uses the `find` command to list all items in the directory, and processes each:
     - **Directories**: Logs the name of the directory.
     - **Files**: Logs the file name, size (in bytes), and last modified time:
       ```bash
       size=$(stat -c%s "$item")
       mod_time=$(stat -c%y "$item")
       ```

4. **Save Results**:
   - Appends directory and file information to the output file.

5. **Completion Message**:
   - Outputs a confirmation message indicating the report has been generated.

---

### **Example Usages**

#### **1. Generate Report for `/home/user/documents`**
```bash
./generate_directory_report.sh /home/user/documents
```
- **Output File**: `directory_report.txt`  
- **Contents**:
  ```
  Directory Report for /home/user/documents
  Generated on: 2023-12-15 12:34:56
  -------------------------------------
  Directory: /home/user/documents
  Directory: /home/user/documents/photos
  File: /home/user/documents/file1.txt | Size: 2048 bytes | Last Modified: 2023-12-10 10:45:32
  File: /home/user/documents/photos/image1.jpg | Size: 524288 bytes | Last Modified: 2023-12-01 09:12:15
  ```

---

#### **2. Generate Report with Custom Output File**
```bash
./generate_directory_report.sh /var/logs logs_report.txt
```
- Saves the report to `logs_report.txt`.

---

### **Customizing the Script**

#### **Exclude Specific Files**
Exclude certain file types (e.g., `.log`) using `find`:
```bash
find "$TARGET_DIR" ! -name "*.log" -print | while read -r item; do
```

#### **Change Report Format**
Modify the report format by including additional metadata, such as file permissions or owner:
```bash
permissions=$(stat -c%A "$item")
owner=$(stat -c%U "$item")
echo "File: $item | Size: $size bytes | Last Modified: $mod_time | Permissions: $permissions | Owner: $owner" >> "$OUTPUT_FILE"
```

#### **Sort Report Entries**
Sort files and directories alphabetically before adding them to the report:
```bash
find "$TARGET_DIR" -print | sort | while read -r item; do
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x generate_directory_report.sh
     ```

2. **Directory Access**:
   - Verify read permissions for the target directory and its contents.

---

### **Output**
- On success:
  ```
  Generating report for /path/to/directory...
  Report saved to directory_report.txt
  Directory report generation complete!
  ```
- On error:
  ```
  Usage: ./generate_directory_report.sh <target_directory>
  ```

---

### **Error Handling**
- Exits with a usage message if required arguments are missing.
- Skips inaccessible files and directories, logging only accessible items.

---

### **Limitations**
1. **Large Directories**:
   - Processing very large directories may take time.
   
2. **Fixed Format**:
   - Customizing the report format requires modifying the script.

3. **Non-Recursive Options**:
   - Processes all subdirectories by default. To limit depth, add `-maxdepth` to the `find` command:
     ```bash
     find "$TARGET_DIR" -maxdepth 1 -print
     ```

---

### **Future Enhancements**
1. Add support for **summary statistics**, such as total files, total size, or largest files.
2. Allow filtering by **modification date** or file type.
3. Include an **interactive mode** for selecting specific files or directories to analyze.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Generate detailed file and directory reports with ease! 🚀