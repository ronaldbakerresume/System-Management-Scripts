### **README: Generate File List with Metadata**

---

#### **Script Name**: `generate_file_list_with_metadata.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script generates a detailed list of all files within a specified directory, including metadata such as file size, owner, permissions, and last modified date. The output is saved to a text file for easy reference.

---

### **Usage**
```bash
./generate_file_list_with_metadata.sh [directory]
```

- **`[directory]`**: The directory to analyze (optional). Defaults to the current directory (`.`).  

---

### **Features**
1. **Detailed Metadata Collection**:
   - Captures file size, owner, permissions, and last modified date for each file.
   
2. **Organized Report**:
   - Saves the output to a formatted text file (`file_list_with_metadata.txt`).

3. **Default Directory Support**:
   - If no directory is provided, processes files in the current directory.

---

### **How It Works**
1. **Input Validation**:
   - Defaults to the current directory if no directory is specified:
     ```bash
     DIR=${1:-.}
     ```

2. **Report Initialization**:
   - Starts the report with a header:
     ```bash
     echo "File List with Metadata:" > "$OUTPUT_FILE"
     echo "------------------------------------------" >> "$OUTPUT_FILE"
     ```

3. **Iterate Through Files**:
   - Uses `find` to list all files in the directory and collects metadata for each:
     - **File Size**: Captured using `stat -c%s`.  
     - **Owner**: Retrieved with `stat -c%U`.  
     - **Permissions**: Displayed in human-readable format using `stat -c%A`.  
     - **Last Modified**: Retrieved with `stat -c%y`.  

4. **Save Metadata**:
   - Appends metadata for each file to the output file:
     ```bash
     echo "File: $file" >> "$OUTPUT_FILE"
     echo "Size: $(stat -c%s "$file") bytes" >> "$OUTPUT_FILE"
     echo "Owner: $(stat -c%U "$file")" >> "$OUTPUT_FILE"
     echo "Permissions: $(stat -c%A "$file")" >> "$OUTPUT_FILE"
     echo "Last Modified: $(stat -c%y "$file")" >> "$OUTPUT_FILE"
     ```

---

### **Example Usages**

#### **1. Generate File List for the Current Directory**
```bash
./generate_file_list_with_metadata.sh
```
- **Output File**: `file_list_with_metadata.txt`  
- Example Output:
  ```
  File List with Metadata:
  ------------------------------------------
  File: ./file1.txt
  Size: 1024 bytes
  Owner: ronald
  Permissions: -rw-r--r--
  Last Modified: 2023-12-15 10:45:00
  ------------------------------------------
  File: ./image1.jpg
  Size: 204800 bytes
  Owner: ronald
  Permissions: -rw-r-----
  Last Modified: 2023-12-10 08:15:00
  ------------------------------------------
  ```

---

#### **2. Generate File List for a Specific Directory**
```bash
./generate_file_list_with_metadata.sh /path/to/directory
```
- Captures metadata for files in `/path/to/directory` and saves the report to `file_list_with_metadata.txt`.

---

### **Customizing the Script**

#### **Change Output File Name**
Modify the `OUTPUT_FILE` variable to use a custom file name:
```bash
OUTPUT_FILE="custom_file_list.txt"
```

#### **Include Additional Metadata**
Enhance the report with more details, such as file creation date or file type:
```bash
echo "File Type: $(file "$file")" >> "$OUTPUT_FILE"
echo "Created: $(stat -c%w "$file")" >> "$OUTPUT_FILE"
```

#### **Filter Specific Files**
List only specific types of files (e.g., `.txt` or `.jpg`):
```bash
find "$DIR" -type f -name "*.txt" | while read -r file; do
```

#### **Sort Files Alphabetically**
Sort the file list before processing:
```bash
find "$DIR" -type f | sort | while read -r file; do
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x generate_file_list_with_metadata.sh
     ```

2. **Directory Access**:
   - Verify read permissions for the target directory and its contents.

3. **Required Tools**:
   - Relies on `stat` and `find`, which are standard utilities in most Linux distributions.

---

### **Error Handling**
- If the directory contains no files, the script outputs an empty report.
- If the specified directory is invalid, the script exits with:
  ```
  Usage: ./generate_file_list_with_metadata.sh [directory]
  ```

---

### **Limitations**
1. **Large Directories**:
   - Processing directories with a large number of files may take time.
   
2. **Metadata Accuracy**:
   - Some metadata, like the file creation date, may not be available on all file systems.

3. **Non-Recursive Options**:
   - Processes all subdirectories by default. To limit depth, add `-maxdepth` to the `find` command:
     ```bash
     find "$DIR" -maxdepth 1 -type f | while read -r file; do
     ```

---

### **Future Enhancements**
1. Add support for **summary statistics**, such as total file size or file count.
2. Implement **interactive mode** for selecting files to include in the report.
3. Allow filtering by file attributes, such as modification date or size.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Generate detailed file lists and metadata with ease! 🚀