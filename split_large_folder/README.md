### **README: Split Large Folder into Subdirectories Script**

---

#### **Script Name**: `split_folder.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script splits a large folder into multiple smaller subdirectories, organizing files into batches of a specified size. It’s ideal for managing large file collections or preparing folders for processing tasks that require size limits.

---

### **Usage**
```bash
./split_folder.sh <source_directory> <files_per_folder>
```

- **`<source_directory>`**: The directory containing files to split (required).  
- **`<files_per_folder>`**: The maximum number of files per subdirectory (required).  

---

### **Features**
1. **Batch Processing**:
   - Divides a large folder into multiple subdirectories, each containing up to the specified number of files.

2. **Automatic Subdirectory Naming**:
   - Creates subdirectories named sequentially as `split_folder_1`, `split_folder_2`, etc.

3. **Dynamic File Handling**:
   - Processes all files in the source directory, regardless of their number or type.

4. **Safe and Simple**:
   - Handles file organization without altering file content or extensions.

---

### **How It Works**
1. **Input Validation**:
   - Ensures the source directory and file limit are provided; otherwise, exits with a usage message:
     ```bash
     SOURCE_DIR=${1?"Usage: $0 <source_directory> <files_per_folder>"}
     FILES_PER_FOLDER=${2?"Usage: $0 <source_directory> <files_per_folder>"}
     ```

2. **Initialize Counters**:
   - Tracks the current subdirectory number and file count:
     ```bash
     folder_count=1
     file_count=0
     ```

3. **Create Initial Subdirectory**:
   - Creates the first subdirectory to begin sorting:
     ```bash
     current_folder="$SOURCE_DIR/split_folder_$folder_count"
     mkdir -p "$current_folder"
     ```

4. **Iterate Over Files**:
   - Loops through files in the source directory and moves them to the current subdirectory:
     ```bash
     mv "$file" "$current_folder"
     ```

5. **Check File Limit**:
   - When the file limit is reached, creates a new subdirectory and resets the file count:
     ```bash
     if [ "$file_count" -ge "$FILES_PER_FOLDER" ]; then
         ((folder_count++))
         current_folder="$SOURCE_DIR/split_folder_$folder_count"
         mkdir -p "$current_folder"
         file_count=0
     fi
     ```

6. **Completion Message**:
   - Outputs the total number of subdirectories created:
     ```bash
     echo "Folder splitting complete. Created $folder_count subdirectories."
     ```

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
file1.txt
file2.jpg
file3.pdf
file4.png
file5.mp3
```

#### **Run the Script**
```bash
./split_folder.sh /path/to/large_folder 2
```

#### **After Running the Script**
Organized directory structure:
```
/path/to/large_folder/
    split_folder_1/
        file1.txt
        file2.jpg
    split_folder_2/
        file3.pdf
        file4.png
    split_folder_3/
        file5.mp3
```

---

### **Customizing the Script**

#### **Change Subdirectory Names**
Modify the naming pattern for subdirectories (e.g., `batch_1`, `batch_2`):
```bash
current_folder="$SOURCE_DIR/batch_$folder_count"
```

#### **Exclude Specific Files**
Skip certain files (e.g., hidden files) by adding a condition:
```bash
if [[ "$file" == .* ]]; then
    continue
fi
```

#### **Preview Changes Before Moving Files**
Print the proposed changes without applying them:
```bash
echo "Would move $file to $current_folder"
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x split_folder.sh
     ```

2. **Valid Source Directory**:
   - Verify the source directory exists and contains files.

3. **Sufficient Space**:
   - Ensure there is enough space for creating subdirectories and moving files.

---

### **Output**

#### **Sample Terminal Output**:
```
Splitting /path/to/large_folder into smaller subdirectories with 2 files each...
Moved /path/to/large_folder/file1.txt to /path/to/large_folder/split_folder_1
Moved /path/to/large_folder/file2.jpg to /path/to/large_folder/split_folder_1
Moved /path/to/large_folder/file3.pdf to /path/to/large_folder/split_folder_2
Moved /path/to/large_folder/file4.png to /path/to/large_folder/split_folder_2
Moved /path/to/large_folder/file5.mp3 to /path/to/large_folder/split_folder_3
Folder splitting complete. Created 3 subdirectories.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the source directory is invalid or inaccessible, the script exits with:
     ```
     Usage: $0 <source_directory> <files_per_folder>
     ```

2. **File Conflicts**:
   - If a file with the same name exists in the target subdirectory, it will overwrite the file. Add a safeguard to avoid this:
     ```bash
     if [ -f "$current_folder/$(basename "$file")" ]; then
         mv "$file" "$current_folder/$(basename "$file")_$(date +%s)"
     else
         mv "$file" "$current_folder"
     fi
     ```

3. **No Files in Directory**:
   - If the source directory contains no files, the script completes without creating any subdirectories.

---

### **Limitations**
1. **Non-Recursive**:
   - Processes only files in the specified directory. To include subdirectories, use:
     ```bash
     find "$SOURCE_DIR" -type f | while read -r file; do
     ```

2. **File Order**:
   - Processes files in the order they appear, which may vary depending on the file system.

3. **Special Characters in File Names**:
   - May encounter issues with files containing unusual characters. Use quotes to handle them:
     ```bash
     mv "$file" "$current_folder"
     ```

---

### **Future Enhancements**
1. Add a **dry-run mode** to preview the splitting process.
2. Include a **summary report** showing the number of files in each subdirectory.
3. Implement a **recursive mode** to include files from subdirectories.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Organize your large folders with ease by splitting them into manageable subdirectories! 🚀