### **README: Find Orphaned Files Script**

---

#### **Script Name**: `find_orphaned_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script identifies orphaned files in a specified directory. Orphaned files are those that lack a corresponding related file with a specific extension. For example, you can use this script to find `.txt` files without a corresponding `.json` file or `.mp4` files without a matching `.srt` file.

---

### **Usage**
```bash
./find_orphaned_files.sh <source_directory> <related_extension>
```

- **`<source_directory>`**: The directory containing the files to check (required).  
- **`<related_extension>`**: The file extension of the related files to look for (required).  

---

### **Features**
1. **File Pair Validation**:
   - Finds files without a matching counterpart based on the specified related file extension.

2. **Base Name Matching**:
   - Uses the base name of files (excluding extensions) to determine relatedness.

3. **Simple Logging**:
   - Outputs the names of orphaned files directly to the terminal.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both the source directory and related file extension are provided. If not, the script exits with:
     ```
     Usage: ./find_orphaned_files.sh <source_directory> <related_extension>
     ```

2. **Iterate Over Files**:
   - Loops through all regular files in the source directory:
     ```bash
     for file in "$SOURCE_DIR"/*; do
         if [ -f "$file" ]; then
     ```

3. **Check for Related Files**:
   - Extracts the base name of each file (without extension) and checks if a related file exists:
     ```bash
     base_name="${file%.*}"
     if [ ! -f "$base_name.$RELATED_EXTENSION" ]; then
     ```

4. **Log Orphaned Files**:
   - Prints the names of files missing their related counterparts to the terminal:
     ```bash
     echo "Orphaned file: $file"
     ```

---

### **Example Usages**

#### **1. Find Orphaned `.txt` Files without Corresponding `.json` Files**
```bash
./find_orphaned_files.sh /path/to/files json
```
- **Source Directory**: `/path/to/files`  
- **Related Extension**: `json`  
- Example:
  - File: `data1.txt` → Missing: `data1.json`  
  - Output:
    ```
    Orphaned file: /path/to/files/data1.txt
    ```

---

#### **2. Find Orphaned `.mp4` Files without `.srt` Subtitle Files**
```bash
./find_orphaned_files.sh /path/to/videos srt
```
- **Source Directory**: `/path/to/videos`  
- **Related Extension**: `srt`  
- Example:
  - File: `video1.mp4` → Missing: `video1.srt`  
  - Output:
    ```
    Orphaned file: /path/to/videos/video1.mp4
    ```

---

### **Customizing the Script**

#### **Log Orphaned Files**
Save orphaned file names to a log file:
```bash
echo "Orphaned file: $file" >> orphaned_files.log
```

#### **Process Specific File Extensions**
Filter the files to check only certain types (e.g., `.txt`):
```bash
for file in "$SOURCE_DIR"/*.txt; do
```

#### **Dry-Run Mode**
Simulate the process without actual output:
```bash
echo "Would check for orphaned file: $file"
```

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x find_orphaned_files.sh
   ```
2. Verify that the source directory contains files with the relevant extensions.

---

### **Output**
- Logs orphaned files directly to the terminal:
  ```
  Orphaned file: /path/to/files/file1.txt
  Orphaned file: /path/to/files/file2.mp4
  ```
- If no orphaned files are found, the script completes without output.

---

### **Error Handling**
- Exits with a usage message if required arguments are missing:
  ```
  Usage: ./find_orphaned_files.sh <source_directory> <related_extension>
  ```
- Skips non-regular files (e.g., directories, symbolic links).

---

### **Limitations**
1. **One-to-One Relationship**:
   - Assumes a strict one-to-one mapping between file types (e.g., one `.txt` file to one `.json` file).

2. **File Overwriting**:
   - Does not handle cases where multiple related files exist for a single base name.

3. **Non-Recursive**:
   - Processes only files in the specified directory. Subdirectories are ignored.

---

### **Future Enhancements**
1. Add support for **recursive processing** of subdirectories.
2. Allow checking for multiple related file types (e.g., `.json` and `.xml` for `.txt` files).
3. Implement a **summary report** of orphaned files for better visibility.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Identify and manage orphaned files with ease! 🚀