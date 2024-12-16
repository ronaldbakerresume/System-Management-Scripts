### **README: Clean Up File Names by Removing Spaces and Special Characters**

---

#### **Script Name**: `clean_file_names.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script cleans up file names in a specified directory by replacing spaces with underscores (`_`) and removing special characters, leaving only alphanumeric characters, underscores, dots, and file extensions intact. It ensures file names are cleaner and easier to work with in various systems.

---

### **Usage**
```bash
./clean_file_names.sh <target_directory>
```

- **`<target_directory>`**: The directory containing the files to clean up (required).

---

### **Features**
1. **Remove Special Characters**:
   - Deletes characters that are not alphanumeric, underscores (`_`), or dots (`.`).
   
2. **Replace Spaces with Underscores**:
   - Converts spaces in file names to underscores for better compatibility.

3. **Preserve Extensions**:
   - Ensures that file extensions remain unaltered during the cleanup process.

4. **Non-Invasive Renaming**:
   - Only renames files if their new, cleaned names differ from the originals.

---

### **Example Usages**

#### **Before Running the Script**
- File names in the directory:
  ```
  My File (2023).txt
  report&data.csv
  cool photo #1.jpg
  ```

#### **Command**
```bash
./clean_file_names.sh /path/to/target
```

#### **After Running the Script**
- Cleaned file names:
  ```
  My_File_2023.txt
  reportdata.csv
  cool_photo_1.jpg
  ```

---

### **How It Works**
1. **Input Validation**:
   - Ensures the target directory is specified, otherwise displays a usage message:
     ```
     Usage: ./clean_file_names.sh <target_directory>
     ```

2. **Clean File Names**:
   - For each file in the directory:
     - Replaces spaces with underscores using `tr`.
     - Removes unwanted special characters using:
       ```bash
       tr -cd '[:alnum:]_.'
       ```
   - Preserves the file’s extension.

3. **Rename Files**:
   - Uses `mv` to rename files, logging each change.

4. **Skip Unchanged Files**:
   - If a file’s name doesn’t need modification, it’s skipped.

---

### **Prerequisites**
1. **Permissions**:
   - Ensure you have read and write permissions for the target directory.
2. **Executable Script**:
   - Make the script executable:
     ```bash
     chmod +x clean_file_names.sh
     ```

---

### **Output**
- For each file that is renamed, the script logs:
  ```
  Renamed: My File (2023).txt -> My_File_2023.txt
  Renamed: report&data.csv -> reportdata.csv
  ```
- Upon completion:
  ```
  File name cleanup complete.
  ```

---

### **Error Handling**
- Skips non-file entries such as directories or symbolic links.
- Does not rename files if the cleaned name matches the original name.

---

### **Limitations**
1. **Non-Recursive**:
   - The script only processes files in the specified directory’s top level. Subdirectories are not scanned.
   
2. **Overwrite Risk**:
   - If the cleaned name matches an existing file name, the original file will be overwritten without warning.

3. **No Preview Mode**:
   - Changes are applied immediately without a dry-run option for previewing the renaming.

---

### **Customizations**

#### **Add Recursive File Name Cleanup**
- Modify the script to include files in subdirectories:
  ```bash
  find "$TARGET_DIR" -type f | while read -r file; do
  ```

#### **Log Changes to a File**
- Add logging to save renamed files:
  ```bash
  echo "Renamed: $(basename "$file") -> $clean_name" >> cleanup_log.txt
  ```

#### **Exclude Certain Files**
- Skip files with specific patterns (e.g., ignore `.tmp` files):
  ```bash
  if [[ "$(basename "$file")" =~ \.tmp$ ]]; then
      continue
  fi
  ```

---

### **Future Enhancements**
1. **Dry-Run Mode**:
   - Add an option to preview changes without applying them.
2. **Exclude Options**:
   - Allow users to specify patterns to exclude certain files.
3. **Improved Overwrite Handling**:
   - Warn or skip files if a cleaned name already exists.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Clean and organize your file names effortlessly! 🚀