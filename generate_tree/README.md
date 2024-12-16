### **README: Generate Folder Tree Script**

---

#### **Script Name**: `generate_folder_tree.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script generates a visual representation of the directory structure starting from a specified folder. The tree includes both folders and files, with emojis to distinguish them (`📂` for folders, `📄` for files). The output is saved to a text file for easy reference.

---

### **Usage**
```bash
./generate_folder_tree.sh [start_directory]
```

- **`[start_directory]`**: The root directory to generate the tree from (optional). Defaults to the current directory (`.`).  

---

### **Features**
1. **Tree-Like Visualization**:
   - Displays a hierarchical structure of folders and files with indentation for clarity.
   
2. **Emoji Indicators**:
   - Uses `📂` to represent folders and `📄` for files.

3. **Default Directory Support**:
   - If no directory is specified, the script generates the tree from the current directory.

4. **Customizable Output**:
   - Saves the folder tree to `folder_tree.txt` by default.

---

### **How It Works**
1. **Input Validation**:
   - Defaults to the current directory (`.`) if no starting directory is provided:
     ```bash
     START_DIR=${1:-.}
     ```

2. **Tree Generation Function**:
   - Recursively traverses directories and files, appending their names to the output file with appropriate indentation:
     ```bash
     generate_tree() {
         local dir="$1"
         local indent="$2"
     ```

3. **Output Formatting**:
   - Appends folder names prefixed with `📂` and file names with `📄` to the output file:
     ```bash
     echo "${indent}📂 $(basename "$entry")" >> "$OUTPUT_FILE"
     echo "${indent}📄 $(basename "$entry")" >> "$OUTPUT_FILE"
     ```

4. **Save Results**:
   - Writes the directory tree structure to `folder_tree.txt` with a clear header.

---

### **Example Usages**

#### **1. Generate Tree for the Current Directory**
```bash
./generate_folder_tree.sh
```
- **Output File**: `folder_tree.txt`  
- Example Output:
  ```
  Tree Structure (from .):
  📂 photos
      📄 image1.jpg
      📄 image2.png
  📂 documents
      📄 report.docx
      📂 presentations
          📄 deck.pptx
  ```

---

#### **2. Generate Tree for a Specific Directory**
```bash
./generate_folder_tree.sh /path/to/folder
```
- Creates a tree structure starting from `/path/to/folder`.

---

### **Customizing the Script**

#### **Change Output File Name**
Modify the `OUTPUT_FILE` variable to save the tree to a custom file:
```bash
OUTPUT_FILE="custom_folder_tree.txt"
```

#### **Include Hidden Files**
To include hidden files and folders, modify the `for` loop:
```bash
for entry in "$dir"/.* "$dir"/*; do
```

#### **Exclude Specific Files or Folders**
Add conditions to skip certain files or directories (e.g., `.git`):
```bash
if [[ "$(basename "$entry")" == ".git" ]]; then
    continue
fi
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x generate_folder_tree.sh
     ```

2. **Directory Access**:
   - Verify read permissions for the target directory and its contents.

---

### **Output**
- Logs the folder tree to `folder_tree.txt`:
  ```
  Tree Structure (from /path/to/folder):
  📂 projects
      📄 README.md
      📂 src
          📄 main.py
          📄 utils.py
      📂 tests
          📄 test_main.py
  ```
- Displays a success message upon completion:
  ```
  Folder tree saved to folder_tree.txt
  ```

---

### **Error Handling**
- If the starting directory does not exist or is inaccessible, the script logs an error and exits.
- Skips symbolic links or files with restricted access, but continues processing other files.

---

### **Limitations**
1. **Large Directories**:
   - Traversing directories with a large number of files may take time.

2. **Non-ASCII Characters**:
   - Filenames with non-ASCII characters may not render correctly in the output file.

3. **Non-Recursive Options**:
   - Processes all subdirectories by default. To limit depth, modify the script to include a depth parameter.

---

### **Future Enhancements**
1. Add support for **depth limits** to control the level of recursion.
2. Implement a **file size summary** alongside the tree structure.
3. Allow output to be formatted as **JSON** or **HTML** for better integration with other tools.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Create beautiful and organized folder trees in seconds! 🚀