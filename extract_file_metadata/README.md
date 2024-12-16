### **README: Extract Metadata from Files**

---

#### **Script Name**: `extract_file_metadata.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script extracts metadata from files in a specified directory (or the current directory by default) and saves the details to a text file. It uses the `file` command to identify file types and associated metadata, making it useful for analyzing files such as images, audio, videos, or documents.

---

### **Usage**
```bash
./extract_file_metadata.sh [directory]
```

- **`[directory]`**: The directory containing the files to analyze (optional). Defaults to the current directory (`.`).  

---

### **Features**
1. **Metadata Extraction**:
   - Extracts metadata for all regular files in the specified directory using the `file` command.

2. **Organized Output**:
   - Saves metadata information for each file to `file_metadata.txt` with clear separators.

3. **Default to Current Directory**:
   - If no directory is specified, processes files in the current directory.

---

### **How It Works**
1. **Input Validation**:
   - If no directory is provided, defaults to the current directory:
     ```bash
     DIR=${1:-.}
     ```

2. **Clear Output File**:
   - Clears the content of `file_metadata.txt` at the start to avoid appending:
     ```bash
     > "$OUTPUT_FILE"
     ```

3. **Iterate Over Files**:
   - Loops through each file in the directory, excluding subdirectories:
     ```bash
     for file in "$DIR"/*; do
         if [ -f "$file" ]; then
     ```

4. **Extract Metadata**:
   - Uses the `file` command to extract file type and metadata, appending the output to `file_metadata.txt`:
     ```bash
     file "$file" >> "$OUTPUT_FILE" 2>&1
     ```

5. **Log Separator**:
   - Adds a separator between file entries for better readability:
     ```bash
     echo "---------------------------------" >> "$OUTPUT_FILE"
     ```

---

### **Example Usages**

#### **1. Extract Metadata from Files in the Current Directory**
```bash
./extract_file_metadata.sh
```
- Processes all files in the current directory and saves metadata to `file_metadata.txt`.

---

#### **2. Extract Metadata from Files in a Specific Directory**
```bash
./extract_file_metadata.sh /path/to/directory
```
- Processes files in `/path/to/directory` and saves metadata to `file_metadata.txt`.

---

### **Customizing the Script**

#### **Change Output File Name**
Modify the `OUTPUT_FILE` variable to use a different file name:
```bash
OUTPUT_FILE="metadata_report.txt"
```

#### **Filter Specific File Types**
Analyze only specific types of files (e.g., `.jpg`, `.mp3`):
```bash
for file in "$DIR"/*.jpg; do
```

#### **Add Additional Metadata Extraction Tools**
Enhance the script with other metadata extraction utilities, such as:
- **`exiftool`** for image or video metadata:
  ```bash
  exiftool "$file" >> "$OUTPUT_FILE"
  ```
- **`mediainfo`** for detailed media file metadata:
  ```bash
  mediainfo "$file" >> "$OUTPUT_FILE"
  ```

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x extract_file_metadata.sh
   ```
2. Verify that the `file` command is available (it is installed by default on most Linux distributions).

---

### **Output**
- Metadata is saved to `file_metadata.txt` in the same directory as the script.
- Example output:
  ```
  Metadata for /path/to/file1.jpg:
  /path/to/file1.jpg: JPEG image data, Exif standard
  ---------------------------------
  Metadata for /path/to/file2.mp3:
  /path/to/file2.mp3: Audio file with ID3 version 2.4.0
  ---------------------------------
  ```

---

### **Error Handling**
- If no regular files exist in the directory, the script outputs:
  ```
  Metadata saved to file_metadata.txt
  ```
  But the file will be empty.
- Handles permission errors when accessing files and logs them to `file_metadata.txt`.

---

### **Limitations**
1. **Basic Metadata Only**:
   - Uses the `file` command, which provides minimal information about files. Additional tools like `exiftool` or `mediainfo` can be used for detailed metadata.

2. **Excludes Subdirectories**:
   - Processes only files in the specified directory. To include subdirectories, replace the loop with:
     ```bash
     find "$DIR" -type f | while read -r file; do
     ```

---

### **Future Enhancements**
1. Add support for **recursive scanning** to process files in subdirectories.
2. Integrate additional tools for extracting **detailed metadata** from images, videos, and documents.
3. Allow filtering files by size, type, or modification date.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Effortlessly extract file metadata with precision! 🚀