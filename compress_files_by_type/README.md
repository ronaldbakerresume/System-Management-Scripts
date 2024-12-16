### **README: Compress Specific File Types into an Archive**

---

#### **Script Name**: `compress_specific_file_types.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script compresses all files of a specific type (based on file extension) within a specified directory into a single `.tar.gz` archive. It is useful for grouping similar files for backup, transfer, or storage.

---

### **Usage**
```bash
./compress_specific_file_types.sh <source_directory> <file_extension> <archive_name>
```

- **`<source_directory>`**: The directory where the script searches for files (required).  
- **`<file_extension>`**: The type of files to compress (e.g., `txt`, `jpg`) (required).  
- **`<archive_name>`**: The name of the resulting archive file (include `.tar.gz`) (required).  

---

### **Features**
1. **File Type Filtering**:
   - Compresses only files matching the specified extension.
   
2. **Single Archive Output**:
   - Combines all matching files into a single `.tar.gz` archive for easy storage or transfer.

3. **Flexible Input**:
   - Supports custom source directories and output file names.

4. **Error Handling**:
   - Ensures a clean output message, indicating success or failure.

---

### **Example Usages**

#### **1. Compress All `.txt` Files**
```bash
./compress_specific_file_types.sh /path/to/documents txt text_files_archive.tar.gz
```
- **Source Directory**: `/path/to/documents`  
- **File Type**: `.txt`  
- **Archive Name**: `text_files_archive.tar.gz`  
- Result: All `.txt` files in `/path/to/documents` are compressed into `text_files_archive.tar.gz`.

---

#### **2. Compress All `.jpg` Files**
```bash
./compress_specific_file_types.sh /path/to/photos jpg images_archive.tar.gz
```
- **Source Directory**: `/path/to/photos`  
- **File Type**: `.jpg`  
- **Archive Name**: `images_archive.tar.gz`  
- Result: All `.jpg` files in `/path/to/photos` are compressed into `images_archive.tar.gz`.

---

### **How It Works**
1. **Input Validation**:
   - Ensures all required arguments are provided. If not, the script exits with a usage message:
     ```
     Usage: ./compress_specific_file_types.sh <source_directory> <file_extension> <archive_name>
     ```

2. **Find Matching Files**:
   - Uses the `find` command to locate files in the source directory that match the specified extension:
     ```bash
     find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -print
     ```

3. **Create Archive**:
   - Compresses the found files into a `.tar.gz` archive using `tar`:
     ```bash
     tar -czf "$ARCHIVE_NAME" -T -
     ```

4. **Log Results**:
   - Displays success or failure messages in the terminal.

---

### **Prerequisites**
1. Ensure the script has execute permissions:
   ```bash
   chmod +x compress_specific_file_types.sh
   ```
2. Verify that the source directory exists and contains matching files.

---

### **Output**
- **Success Message**:
  ```
  Compression complete. Archive saved as <archive_name>.
  ```
- **Failure Message**:
  ```
  An error occurred during compression.
  ```

---

### **Error Handling**
- Exits gracefully if arguments are missing or invalid:
  ```
  Usage: ./compress_specific_file_types.sh <source_directory> <file_extension> <archive_name>
  ```
- If no matching files are found, the resulting archive will be empty.

---

### **Limitations**
1. **File Overwrite**:
   - If an archive with the same name already exists, it will be overwritten without warning.
   
2. **Non-Recursive**:
   - Only processes files in the specified directory and its subdirectories. To avoid deep recursion, modify the `find` command.

3. **Compression Format**:
   - Only supports `.tar.gz` format. For other formats (e.g., `.zip`), additional tools like `zip` would be required.

---

### **Customizations**

#### **Change Compression Format**
To create a `.zip` archive instead of `.tar.gz`:
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -exec zip "$ARCHIVE_NAME" {} +
```

#### **Recursive Option**
Modify the `find` command to process subdirectories if desired:
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" -print
```

#### **Exclude Certain Files**
To exclude specific files (e.g., temporary or large files), add an exclusion rule:
```bash
find "$SOURCE_DIR" -type f -name "*.$EXTENSION" ! -name "exclude_this_file*" -print
```

---

### **Future Enhancements**
1. Add **dry-run mode** to preview files before compressing them.
2. Support **multiple extensions** in a single run.
3. Implement **progress tracking** for large file sets.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Streamline your file compression tasks with precision! 🚀