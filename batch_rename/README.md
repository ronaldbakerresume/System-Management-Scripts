### **README: Add Prefix to All Files in a Directory**

---

#### **Script Name**: `add_prefix_to_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script adds a predefined prefix to the names of all files in the current working directory. It simplifies batch renaming tasks, making it easier to standardize file names.

---

### **Usage**
```bash
./add_prefix_to_files.sh
```

---

### **Features**
1. **Batch File Renaming**:
   - Automatically renames all files in the current directory by adding the specified prefix.
   
2. **Customizable Prefix**:
   - Easily modify the prefix by editing the `PREFIX` variable in the script.

3. **File Safety**:
   - Processes only regular files and skips directories or other non-file entities.

---

### **How It Works**
1. **Define Prefix**:
   - The `PREFIX` variable is set at the start of the script:
     ```bash
     PREFIX="myfile_"
     ```

2. **Iterate Over Files**:
   - The script loops through all files (`*`) in the current directory.

3. **Rename Files**:
   - Each file is renamed by prepending the prefix using the `mv` command:
     ```bash
     mv "$file" "${PREFIX}${file}"
     ```

4. **Log Actions**:
   - Displays a message for each renamed file:
     ```
     Renamed oldfile.txt to myfile_oldfile.txt
     ```

---

### **Example Usages**

#### **Default Prefix**
- **Prefix**: `myfile_`
- **Before Running**:
  ```
  report1.txt
  data.csv
  ```
- **Command**:
  ```bash
  ./add_prefix_to_files.sh
  ```
- **After Running**:
  ```
  myfile_report1.txt
  myfile_data.csv
  ```

#### **Customize the Prefix**
Edit the script to use a different prefix:
```bash
PREFIX="project_"
```
- **Before Running**:
  ```
  image1.png
  document.pdf
  ```
- **After Running**:
  ```
  project_image1.png
  project_document.pdf
  ```

---

### **Customizing the Script**

#### **Change the Target Directory**
To rename files in a different directory, replace the wildcard `*` with a path:
```bash
for file in /path/to/target/*; do
```

#### **Add a Suffix Instead of a Prefix**
Modify the script to append a suffix instead:
```bash
SUFFIX="_backup"
mv "$file" "${file}${SUFFIX}"
```

#### **Exclude Certain Files**
Exclude specific files (e.g., files starting with `temp_`):
```bash
if [[ ! "$file" =~ ^temp_ ]]; then
    mv "$file" "${PREFIX}${file}"
fi
```

---

### **Prerequisites**
1. Ensure the script has execute permissions:
   ```bash
   chmod +x add_prefix_to_files.sh
   ```

2. Verify that the directory contains the files you want to rename.

---

### **Output**
The script logs the renaming of each file:
```
Renamed report.txt to myfile_report.txt
Renamed data.csv to myfile_data.csv
Batch renaming complete!
```

---

### **Error Handling**
- The script skips non-file entries, such as directories or symbolic links.
- Files that already match the target name pattern will not be renamed again (avoids prefix duplication).

---

### **Limitations**
1. **Non-Reversible**:
   - The script does not provide an automatic way to remove prefixes. Use a separate script for reversing renaming if needed.
   
2. **Conflicting File Names**:
   - If the renamed file matches an existing file name, it will overwrite the existing file without warning.

3. **No Recursive Renaming**:
   - Only processes files in the current directory. Subdirectories are ignored.

---

### **Future Enhancements**
1. Add support for recursive renaming in nested directories.
2. Implement an interactive mode for confirming each renaming action.
3. Include a backup option to store original file names in a log.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Standardize your file names in seconds! 🚀