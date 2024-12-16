### **README: Merge All `.txt` Files Script**

---

#### **Script Name**: `merge_txt_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script merges the content of all `.txt` files from a specified directory into a single output file. Each file's content is clearly separated in the output file with header and footer markers, ensuring readability.

---

### **Usage**
```bash
./merge_txt_files.sh <source_directory> <output_file>
```

- **`<source_directory>`**: The directory containing `.txt` files to merge (required).  
- **`<output_file>`**: The file where the merged content will be saved (required).  

---

### **Features**
1. **Automatic File Merging**:
   - Combines all `.txt` files in the specified directory into a single file.

2. **File Delimiters**:
   - Adds markers (`===== Start of <filename> =====` and `===== End of <filename> =====`) around each file's content in the output.

3. **Custom Output File**:
   - Allows users to specify a name for the merged output file.

4. **Blank Line Separation**:
   - Inserts a blank line between the contents of consecutive files for clarity.

---

### **How It Works**
1. **Input Validation**:
   - Exits with a usage message if the source directory or output file is not specified:
     ```bash
     Usage: ./merge_txt_files.sh <source_directory> <output_file>
     ```

2. **Clear Output File**:
   - Clears the content of the output file if it already exists to avoid appending:
     ```bash
     > "$OUTPUT_FILE"
     ```

3. **Iterate Through `.txt` Files**:
   - Uses a `for` loop to process all `.txt` files in the source directory:
     ```bash
     for file in "$SOURCE_DIR"/*.txt; do
         if [ -f "$file" ]; then
     ```

4. **Add File Content**:
   - Appends each file's content to the output file, surrounded by header and footer markers:
     ```bash
     echo "===== Start of $file =====" >> "$OUTPUT_FILE"
     cat "$file" >> "$OUTPUT_FILE"
     echo "===== End of $file =====" >> "$OUTPUT_FILE"
     echo "" >> "$OUTPUT_FILE"
     ```

5. **Completion Message**:
   - Logs a success message to indicate the merge is complete.

---

### **Example Usages**

#### **1. Merge Files in `/home/user/documents`**
```bash
./merge_txt_files.sh /home/user/documents merged_output.txt
```
- Combines all `.txt` files in `/home/user/documents` into `merged_output.txt`.

---

#### **2. Merge Files in the Current Directory**
```bash
./merge_txt_files.sh . all_texts_combined.txt
```
- Merges all `.txt` files in the current directory into `all_texts_combined.txt`.

---

### **Customizing the Script**

#### **Change File Delimiters**
Modify the header and footer markers to use a custom format:
```bash
echo "--- File: $file ---" >> "$OUTPUT_FILE"
```

#### **Exclude Certain Files**
Add a condition to skip specific files (e.g., `exclude.txt`):
```bash
if [[ "$(basename "$file")" == "exclude.txt" ]]; then
    continue
fi
```

#### **Process Specific File Types**
Adapt the script to merge other file types (e.g., `.log`):
```bash
for file in "$SOURCE_DIR"/*.log; do
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x merge_txt_files.sh
     ```

2. **Directory and File Access**:
   - Verify read permissions for the `.txt` files and write permissions for the output file.

---

### **Output**
- **Merged Output Example**:
  ```
  ===== Start of /home/user/documents/file1.txt =====
  Content of file1.txt
  ===== End of /home/user/documents/file1.txt =====

  ===== Start of /home/user/documents/file2.txt =====
  Content of file2.txt
  ===== End of /home/user/documents/file2.txt =====
  ```

- On successful completion:
  ```
  Merging all .txt files from /home/user/documents into merged_output.txt...
  Adding content from /home/user/documents/file1.txt to merged_output.txt...
  Adding content from /home/user/documents/file2.txt to merged_output.txt...
  Merging complete. Merged content saved to merged_output.txt.
  ```

---

### **Error Handling**
1. **No `.txt` Files Found**:
   - If no `.txt` files are present in the directory, the script completes without creating the output file.

2. **Invalid Directory**:
   - If the source directory does not exist or is invalid, the script exits with:
     ```
     Usage: ./merge_txt_files.sh <source_directory> <output_file>
     ```

3. **File Writing Errors**:
   - If the output file cannot be written (e.g., due to insufficient permissions), the script logs an error.

---

### **Limitations**
1. **File Order**:
   - Processes files in the order returned by the shell. To sort files alphabetically, use:
     ```bash
     for file in $(ls "$SOURCE_DIR"/*.txt | sort); do
     ```

2. **Large Files**:
   - Processing directories with many large files may take time.

3. **File Type Restriction**:
   - Merges only `.txt` files by default.

---

### **Future Enhancements**
1. Add a summary of the total number of files processed and the combined file size.
2. Provide an option to include the modification date of each file in the output.
3. Implement support for **recursive merging** from subdirectories.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Merge your text files effortlessly with precision! 🚀