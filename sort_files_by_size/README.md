### **README: Sort Files by Size Script**

---

#### **Script Name**: `sort_files_by_size.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script organizes files in a specified directory into subdirectories based on their sizes: **small**, **medium**, and **large**. Files are categorized using user-defined size thresholds, making it easy to manage files based on their storage requirements.

---

### **Usage**
```bash
./sort_files_by_size.sh <target_directory>
```

- **`<target_directory>`**: The directory containing the files to sort (required).  

---

### **Features**
1. **Size-Based Categorization**:
   - Files are divided into three categories:
     - **Small**: Files ≤ 100 KB.
     - **Medium**: Files > 100 KB and ≤ 1000 KB.
     - **Large**: Files > 1000 KB.

2. **Automatic Subdirectory Creation**:
   - Creates subdirectories `small_files`, `medium_files`, and `large_files` in the target directory.

3. **Dynamic Handling**:
   - Processes all files in the target directory regardless of the number or type.

4. **Logs File Movements**:
   - Outputs details of file movements during the sorting process.

---

### **How It Works**
1. **Input Validation**:
   - Ensures a target directory is specified; otherwise, exits with a usage message:
     ```bash
     TARGET_DIR=${1?"Usage: $0 <target_directory>"}
     ```

2. **Define Size Thresholds**:
   - Sets the size thresholds for small, medium, and large files:
     ```bash
     SMALL_THRESHOLD=100   # Files <= 100 KB
     MEDIUM_THRESHOLD=1000 # Files > 100 KB and <= 1000 KB
     ```

3. **Create Subdirectories**:
   - Creates `small_files`, `medium_files`, and `large_files` directories if they don’t already exist:
     ```bash
     mkdir -p "$SMALL_DIR" "$MEDIUM_DIR" "$LARGE_DIR"
     ```

4. **Iterate Over Files**:
   - Loops through all files in the target directory and calculates their size in KB:
     ```bash
     size_kb=$(du -k "$file" | cut -f1)
     ```

5. **Sort Files by Size**:
   - Moves files to the appropriate subdirectory based on their size:
     - Small files (≤ 100 KB) → `small_files/`
     - Medium files (> 100 KB and ≤ 1000 KB) → `medium_files/`
     - Large files (> 1000 KB) → `large_files/`
     ```bash
     if [ "$size_kb" -le "$SMALL_THRESHOLD" ]; then
         mv "$file" "$SMALL_DIR/"
     elif [ "$size_kb" -le "$MEDIUM_THRESHOLD" ]; then
         mv "$file" "$MEDIUM_DIR/"
     else
         mv "$file" "$LARGE_DIR/"
     fi
     ```

6. **Completion Message**:
   - Logs a success message upon completion:
     ```bash
     echo "File sorting by size complete."
     ```

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
small_file.txt  (50 KB)
medium_file.pdf (800 KB)
large_file.iso  (1500 KB)
```

#### **Run the Script**
```bash
./sort_files_by_size.sh /path/to/directory
```

#### **After Running the Script**
Sorted directory structure:
```
/path/to/directory/
    small_files/
        small_file.txt
    medium_files/
        medium_file.pdf
    large_files/
        large_file.iso
```

---

### **Customizing the Script**

#### **Adjust Size Thresholds**
Change the size thresholds by modifying the variables:
```bash
SMALL_THRESHOLD=200    # Files ≤ 200 KB
MEDIUM_THRESHOLD=2000  # Files > 200 KB and ≤ 2000 KB
```

#### **Include Other Criteria**
To sort files based on additional criteria, such as modification date, incorporate the `find` command:
```bash
find "$TARGET_DIR" -type f -mtime +30 -exec mv {} "$OLD_FILES_DIR/" \;
```

#### **Recursive Sorting**
Include files in subdirectories by replacing the `for` loop with a recursive `find` command:
```bash
find "$TARGET_DIR" -type f | while read -r file; do
    size_kb=$(du -k "$file" | cut -f1)
    ...
done
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x sort_files_by_size.sh
     ```

2. **Valid Target Directory**:
   - Verify the target directory exists and contains files.

3. **Dependencies**:
   - Uses standard tools (`du`, `mkdir`, `mv`) available in most Linux distributions.

---

### **Output**

#### **Sample Terminal Output**:
```
Sorting files in /path/to/directory by size...
Moved /path/to/directory/small_file.txt to /path/to/directory/small_files/
Moved /path/to/directory/medium_file.pdf to /path/to/directory/medium_files/
Moved /path/to/directory/large_file.iso to /path/to/directory/large_files/
File sorting by size complete.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the target directory is invalid or inaccessible, the script exits with:
     ```
     Usage: $0 <target_directory>
     ```

2. **No Files in Directory**:
   - If the directory contains no files, the script completes without sorting anything.

3. **File Conflicts**:
   - Overwrites existing files with the same name in the target subdirectories. Add a safeguard to avoid this:
     ```bash
     if [ -f "$new_name" ]; then
         new_name="${new_name%.*}_$(date +%s).${new_name##*.}"
     fi
     ```

---

### **Limitations**
1. **Non-Recursive**:
   - Processes only files in the specified directory. Use the recursive sorting example for subdirectories.

2. **File Size Accuracy**:
   - Relies on `du` for size calculation, which may vary depending on file system block size.

3. **Special Characters in File Names**:
   - May encounter issues with files containing unusual characters. Use quotes to handle them:
     ```bash
     mv "$file" "$new_name"
     ```

---

### **Future Enhancements**
1. Add a **summary report** showing the total number of files sorted and their sizes.
2. Implement a **dry-run mode** to preview sorting without applying changes.
3. Include **custom subdirectory names** via command-line arguments.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Effortlessly organize your files by size with this robust script! 🚀