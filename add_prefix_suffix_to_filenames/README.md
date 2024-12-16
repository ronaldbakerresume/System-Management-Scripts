### **README: Add Prefix or Suffix to File Names**

---

#### **Script Name**: `add_prefix_suffix_to_filenames.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script allows you to add a **prefix** and/or **suffix** to the file names in a specified directory. It preserves the file extensions and ensures the original file contents remain unaltered. Use it to organize or standardize file naming conventions effectively.

---

### **Usage**
```bash
./add_prefix_suffix_to_filenames.sh <target_directory> <prefix> <suffix>
```

- **`<target_directory>`**: The directory containing the files to rename (required).  
- **`<prefix>`**: The string to prepend to each file name (optional; defaults to an empty string).  
- **`<suffix>`**: The string to append to each file name (optional; defaults to an empty string).  

---

### **Example Usages**

#### **Add a Prefix to File Names**
```bash
./add_prefix_suffix_to_filenames.sh /path/to/files myprefix_ ""
```
- Files:  
  `file1.txt` → `myprefix_file1.txt`  
  `file2.jpg` → `myprefix_file2.jpg`

---

#### **Add a Suffix to File Names**
```bash
./add_prefix_suffix_to_filenames.sh /path/to/files "" _backup
```
- Files:  
  `file1.txt` → `file1_backup.txt`  
  `file2.jpg` → `file2_backup.jpg`

---

#### **Add Both Prefix and Suffix**
```bash
./add_prefix_suffix_to_filenames.sh /path/to/files new_ _v1
```
- Files:  
  `file1.txt` → `new_file1_v1.txt`  
  `file2.jpg` → `new_file2_v1.jpg`

---

#### **Handle Default Values**
If either the **prefix** or **suffix** is omitted, the script uses an empty string (`""`) for that part of the name. For example:
```bash
./add_prefix_suffix_to_filenames.sh /path/to/files prefix_ ""
```
- Files:  
  `example.doc` → `prefix_example.doc`

---

### **How It Works**
1. The script iterates over all files in the specified directory.
2. Each file’s base name and extension are separated using string manipulation.
3. The new file name is constructed by combining:
   - The **prefix** (if provided).  
   - The original base name of the file.  
   - The **suffix** (if provided).  
   - The file extension.  
4. The file is renamed using the `mv` command.

---

### **Prerequisites**
- Ensure you have execute permissions for the script:
  ```bash
  chmod +x add_prefix_suffix_to_filenames.sh
  ```
- Verify that the **target directory** exists and contains files to rename.

---

### **Output**
- For each file renamed, the script logs the operation:
  ```bash
  Renaming: /path/to/files/file1.txt -> /path/to/files/myprefix_file1_backup.txt
  ```
- Upon completion, it displays:
  ```bash
  File renaming with prefix and suffix complete.
  ```

---

### **Error Handling**
- If the **target directory** is not provided, the script will terminate and display the usage message:
  ```bash
  Usage: ./add_prefix_suffix_to_filenames.sh <target_directory> <prefix> <suffix>
  ```
- The script skips directories and only processes regular files.

---

### **Limitations**
- The script only operates on files in the **top-level directory**. Subdirectories are not processed.
- Be cautious with prefixes or suffixes containing special characters, as they may affect file paths.

---

### **Future Enhancements**
- Add recursive functionality to process files in nested directories.
- Implement a dry-run mode to preview changes before renaming files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

Enjoy renaming your files efficiently! 🚀