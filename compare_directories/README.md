### **README: Compare Two Directories and List Differences**

---

#### **Script Name**: `compare_directories.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script compares the contents of two directories and identifies differences, such as missing files, differing file contents, and extra files in one directory. It outputs the results to both the terminal and a log file for easy reference.

---

### **Usage**
```bash
./compare_directories.sh <directory1> <directory2>
```

- **`<directory1>`**: The first directory to compare (required).  
- **`<directory2>`**: The second directory to compare (required).  

---

### **Features**
1. **Recursive Comparison**:
   - Compares all files and subdirectories within the specified directories.
   
2. **Log File Output**:
   - Saves the comparison results to a log file named `directory_comparison.txt`.

3. **Human-Readable Differences**:
   - Highlights differences such as:
     - Files present in one directory but not the other.
     - Files with differing content.

4. **Efficient Comparison**:
   - Uses the `diff` command with the `-rq` flags to quickly identify differences.

---

### **Example Usages**

#### **Compare Two Project Directories**
```bash
./compare_directories.sh /path/to/project1 /path/to/project2
```
- Output:
  ```
  Only in /path/to/project1: unique_file1.txt
  Files /path/to/project1/shared_file.txt and /path/to/project2/shared_file.txt differ
  ```
- Log file `directory_comparison.txt` contains the same output for future reference.

---

#### **Compare Backups**
```bash
./compare_directories.sh /path/to/original /path/to/backup
```
- Identifies missing files in the backup or any discrepancies between the two directories.

---

### **How It Works**
1. **Input Validation**:
   - Ensures both directory paths are provided as arguments. If not, displays the usage message:
     ```
     Usage: ./compare_directories.sh <directory1> <directory2>
     ```

2. **Run `diff` Command**:
   - Executes the `diff` command with the `-rq` flags:
     - `-r`: Recursively compares subdirectories.
     - `-q`: Reports if files differ but not the exact differences.
   - Outputs the comparison results to both the terminal and a log file:
     ```bash
     diff -rq "$DIR1" "$DIR2" | tee directory_comparison.txt
     ```

3. **Save Results to Log**:
   - Stores the comparison results in `directory_comparison.txt` in the current directory.

---

### **Prerequisites**
1. Ensure both directories exist and are accessible.
2. Make the script executable:
   ```bash
   chmod +x compare_directories.sh
   ```

---

### **Output**
- **Terminal Output**:
  ```
  Comparing directories: /path/to/dir1 and /path/to/dir2
  Only in /path/to/dir1: file1.txt
  Files /path/to/dir1/file2.txt and /path/to/dir2/file2.txt differ
  ```
- **Log File (`directory_comparison.txt`)**:
  ```
  Only in /path/to/dir1: file1.txt
  Files /path/to/dir1/file2.txt and /path/to/dir2/file2.txt differ
  ```

---

### **Error Handling**
- If one or both directories are missing, the script terminates with:
  ```
  Usage: ./compare_directories.sh <directory1> <directory2>
  ```
- If directories are inaccessible (e.g., insufficient permissions), `diff` outputs an error message.

---

### **Limitations**
1. **File Content Differences**:
   - Reports that files differ but does not display detailed content differences. Use `diff` without the `-q` flag to see detailed differences:
     ```bash
     diff -r "$DIR1" "$DIR2"
     ```

2. **No Support for Large Logs**:
   - For large directory trees, the log file can become unwieldy.

3. **Hardcoded Log File Name**:
   - Results are always saved to `directory_comparison.txt` in the current working directory.

---

### **Customizations**

#### **Change Log File Name**
Allow users to specify a custom log file name:
```bash
LOG_FILE=${3:-directory_comparison.txt}
diff -rq "$DIR1" "$DIR2" | tee "$LOG_FILE"
```

#### **Skip Certain Files**
Exclude specific file types (e.g., `.log` or `.tmp`) from the comparison:
```bash
diff -rq --exclude="*.log" --exclude="*.tmp" "$DIR1" "$DIR2"
```

#### **Visual Output**
Use `colordiff` for colored output:
```bash
diff -rq "$DIR1" "$DIR2" | colordiff | tee directory_comparison.txt
```

---

### **Future Enhancements**
1. Add an option to **summarize differences** (e.g., total mismatched files).
2. Integrate a **detailed mode** to show exact file content differences for mismatched files.
3. Support **ignoring certain patterns** (e.g., temporary files or `.git` folders).

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Effortlessly identify and log directory differences! 🚀