### **README: Extract and Move Compressed Files**

---

#### **Script Name**: `extract_and_move_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script extracts the contents of compressed files (e.g., `.tar.gz`, `.zip`, `.rar`) from a source directory and moves the extracted files to a specified destination directory. It automates the tedious process of manually extracting files and organizing them into a single location.

---

### **Usage**
```bash
./extract_and_move_files.sh <source_directory> <destination_directory>
```

- **`<source_directory>`**: The directory containing compressed files to extract (required).  
- **`<destination_directory>`**: The directory where the extracted files will be moved (required).  

---

### **Features**
1. **Support for Multiple Compression Formats**:
   - Handles `.tar.gz`, `.zip`, and `.rar` file formats.

2. **Automated Directory Creation**:
   - Creates the destination directory if it doesn’t already exist.

3. **Organized Extraction**:
   - Ensures all extracted files are moved to the specified destination directory.

4. **Iterative Processing**:
   - Extracts and processes all supported compressed files in the source directory.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both the source and destination directories are provided. If not, the script exits with a usage message:
     ```
     Usage: ./extract_and_move_files.sh <source_directory> <destination_directory>
     ```

2. **Create Destination Directory**:
   - Ensures the destination directory exists using:
     ```bash
     mkdir -p "$DEST_DIR"
     ```

3. **Iterate Over Compressed Files**:
   - Loops through files in the source directory to identify compressed files:
     - **`.tar.gz`**: Extracted using `tar -xzf`.  
     - **`.zip`**: Extracted using `unzip`.  
     - **`.rar`**: Extracted using `unrar`.  

4. **Extract and Move**:
   - Extracts the contents of each compressed file into the destination directory.

5. **Log Actions**:
   - Displays progress messages for each processed file.

---

### **Example Usages**

#### **1. Extract `.tar.gz` and `.zip` Files**
```bash
./extract_and_move_files.sh /path/to/source /path/to/destination
```
- **Source Directory**: `/path/to/source`  
- **Destination Directory**: `/path/to/destination`  
- Extracted files from `/path/to/source/*.tar.gz` and `/path/to/source/*.zip` are moved to `/path/to/destination`.

---

#### **2. Include `.rar` Files**
Ensure `unrar` is installed before processing `.rar` files:
```bash
sudo apt install unrar  # For Ubuntu/Debian
sudo yum install unrar  # For CentOS/Red Hat
```
Run the script as usual:
```bash
./extract_and_move_files.sh /path/to/source /path/to/destination
```

---

### **Customizing the Script**

#### **Add Support for Other Compression Formats**
To include `.7z` files, add this block inside the loop:
```bash
elif [[ "$file" == *.7z ]]; then
    echo "Extracting $file..."
    7z x "$file" -o"$DEST_DIR"
fi
```
- Ensure `7zip` is installed:
  ```bash
  sudo apt install p7zip-full
  ```

#### **Dry-Run Mode**
Preview the files to be processed without extracting them:
```bash
for file in "$SOURCE_DIR"/*; do
    if [[ "$file" == *.tar.gz || "$file" == *.zip || "$file" == *.rar ]]; then
        echo "Would extract: $file"
    fi
done
```

#### **Log Extracted Files**
Save extracted file paths to a log file:
```bash
echo "$file extracted to $DEST_DIR" >> extracted_files.log
```

---

### **Prerequisites**
1. **Script Execution**:
   - Make the script executable:
     ```bash
     chmod +x extract_and_move_files.sh
     ```

2. **Required Tools**:
   - Ensure the following utilities are installed:
     - `tar` for `.tar.gz` files.
     - `unzip` for `.zip` files.
     - `unrar` for `.rar` files.

---

### **Output**
- Logs progress messages for each extracted file:
  ```
  Extracting /path/to/source/file1.tar.gz...
  Extracting /path/to/source/file2.zip...
  Extracting /path/to/source/file3.rar...
  Extraction and file movement complete.
  ```

---

### **Error Handling**
- Skips files that are not supported compression formats.
- Displays an error if a required tool (e.g., `unrar`) is missing.
- Exits with a usage message if the required arguments are not provided:
  ```
  Usage: ./extract_and_move_files.sh <source_directory> <destination_directory>
  ```

---

### **Limitations**
1. **Supported Formats Only**:
   - Only handles `.tar.gz`, `.zip`, and `.rar` by default. Add support for other formats as needed.
   
2. **Overwrite Behavior**:
   - Files with the same name in the destination directory will overwrite existing files without warning.

3. **Non-Recursive**:
   - Does not process compressed files in subdirectories of the source directory.

---

### **Future Enhancements**
1. Add an option to **skip or rename duplicate files** in the destination directory.
2. Include **recursive processing** for nested directories.
3. Implement **error handling** for corrupted or incomplete compressed files.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Simplify your extraction tasks with ease! 🚀