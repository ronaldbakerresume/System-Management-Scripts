### **README: Convert File Names to Lowercase**

---

#### **Script Name**: `convert_filenames_to_lowercase.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script converts all file names in a specified directory to lowercase. It is useful for standardizing file naming conventions, especially in environments where case sensitivity may cause issues.

---

### **Usage**
```bash
./convert_filenames_to_lowercase.sh <target_directory>
```

- **`<target_directory>`**: The directory containing the files to rename (required).  

---

### **Features**
1. **Case Conversion**:
   - Converts all uppercase letters in file names to lowercase using the `tr` command.
   
2. **File Safety**:
   - Renames files only if the lowercase conversion results in a name change.

3. **Batch Processing**:
   - Processes all files in the specified directory in one run.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is provided. If not, the script displays a usage message and exits:
     ```
     Usage: ./convert_filenames_to_lowercase.sh <target_directory>
     ```

2. **Iterate Through Files**:
   - Loops through each file in the target directory:
     ```bash
     for file in "$TARGET_DIR"/*
     ```

3. **Convert to Lowercase**:
   - Uses the `tr` command to convert the file name to lowercase:
     ```bash
     lowercase_name=$(echo "$file" | tr '[:upper:]' '[:lower:]')
     ```

4. **Rename Files**:
   - Compares the original name with the converted name and renames the file only if they differ:
     ```bash
     mv "$file" "$lowercase_name"
     ```

5. **Log Actions**:
   - Outputs the old and new names for each renamed file.

---

### **Example Usages**

#### **Before Running**
```
Report1.TXT
DATA.csv
MyPhoto.JPG
```

#### **Command**
```bash
./convert_filenames_to_lowercase.sh /path/to/files
```

#### **After Running**
```
report1.txt
data.csv
myphoto.jpg
```

---

### **Customizing the Script**

#### **Process a Different Directory**
To process files in a directory other than the default, specify the path as an argument:
```bash
./convert_filenames_to_lowercase.sh /path/to/your/directory
```

#### **Add Logging**
To save a log of renamed files, append this line:
```bash
echo "$file -> $lowercase_name" >> conversion_log.txt
```

#### **Handle Subdirectories**
To include files in subdirectories, replace the `for` loop with `find`:
```bash
find "$TARGET_DIR" -type f | while read -r file; do
    lowercase_name=$(echo "$file" | tr '[:upper:]' '[:lower:]')
    if [ "$file" != "$lowercase_name" ]; then
        mv "$file" "$lowercase_name"
    fi
done
```

---

### **Prerequisites**
1. **Permissions**:
   - Ensure you have read and write permissions for the target directory.
2. **Executable Script**:
   - Make the script executable:
     ```bash
     chmod +x convert_filenames_to_lowercase.sh
     ```

---

### **Output**
- Renaming actions are logged to the terminal:
  ```
  Renamed: Report1.TXT -> report1.txt
  Renamed: DATA.csv -> data.csv
  ```
- Completion message:
  ```
  File name conversion to lowercase complete.
  ```

---

### **Error Handling**
- Skips non-file entries such as directories or symbolic links.
- If no files require renaming, the script completes silently without errors.

---

### **Limitations**
1. **Non-Recursive**:
   - By default, the script only processes files in the top-level directory.
   
2. **File Overwriting**:
   - If two files differ only in case (e.g., `File.TXT` and `file.txt`), renaming may overwrite one file without warning.

3. **Case-Sensitive Systems**:
   - Some file systems (e.g., Linux ext4) treat files with different cases as distinct, while others (e.g., Windows NTFS) do not.

---

### **Future Enhancements**
1. Add a **dry-run mode** to preview changes without applying them.
2. Implement a **recursive option** to process nested directories.
3. Provide an option to handle conflicts where file names differ only in case.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Standardize your file names effortlessly! 🚀