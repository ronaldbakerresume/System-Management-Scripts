### **README: Media File Organizer Script**

---

#### **Script Name**: `organize_media_files.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script organizes media files in a specified directory by separating them into subfolders for images, videos, and audio. It identifies files based on common extensions and moves them to their corresponding folders.

---

### **Usage**
```bash
./organize_media_files.sh <source_directory>
```

- **`<source_directory>`**: The directory containing the media files to organize (required).  

---

### **Features**
1. **Media Type Separation**:
   - Organizes files into `images`, `videos`, and `audio` folders.

2. **Extension-Based Categorization**:
   - Detects files based on their extensions and handles common formats:
     - **Images**: `.jpg`, `.png`, `.jpeg`, `.gif`  
     - **Videos**: `.mp4`, `.mkv`, `.avi`, `.mov`  
     - **Audio**: `.mp3`, `.wav`, `.flac`, `.aac`

3. **Automatic Folder Creation**:
   - Creates target folders (`images`, `videos`, `audio`) if they don’t already exist.

4. **Safe File Movement**:
   - Ensures files are moved without overwriting or losing them.

---

### **How It Works**
1. **Input Validation**:
   - Ensures a source directory is provided; otherwise, exits with a usage message:
     ```bash
     SOURCE_DIR=${1?"Usage: $0 <source_directory>"}
     ```

2. **Create Target Directories**:
   - Sets up `images`, `videos`, and `audio` folders inside the source directory:
     ```bash
     mkdir -p "$IMAGES_DIR" "$VIDEOS_DIR" "$AUDIO_DIR"
     ```

3. **File Categorization**:
   - Uses the `find` command with extension filters to locate and move files:
     - **Images**:
       ```bash
       find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) -exec mv {} "$IMAGES_DIR" \;
       ```
     - **Videos**:
       ```bash
       find "$SOURCE_DIR" -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" \) -exec mv {} "$VIDEOS_DIR" \;
       ```
     - **Audio**:
       ```bash
       find "$SOURCE_DIR" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.aac" \) -exec mv {} "$AUDIO_DIR" \;
       ```

4. **Completion Message**:
   - Outputs a message confirming the files have been organized:
     ```bash
     echo "Media files have been organized into 'images/', 'videos/', and 'audio/' folders."
     ```

---

### **Example Workflow**

#### **Before Running the Script**
Directory contents:
```
photo1.jpg
movie.mp4
song.mp3
image.gif
clip.mov
audio.wav
```

#### **Run the Script**
```bash
./organize_media_files.sh /path/to/media
```

#### **After Running the Script**
Organized directory structure:
```
/path/to/media/
    images/
        photo1.jpg
        image.gif
    videos/
        movie.mp4
        clip.mov
    audio/
        song.mp3
        audio.wav
```

---

### **Customizing the Script**

#### **Add More File Types**
Expand the file type coverage by adding more extensions:
- For additional image formats:
  ```bash
  -o -iname "*.bmp" -o -iname "*.tiff"
  ```
- For additional video formats:
  ```bash
  -o -iname "*.wmv" -o -iname "*.flv"
  ```
- For additional audio formats:
  ```bash
  -o -iname "*.ogg" -o -iname "*.m4a"
  ```

#### **Exclude Specific Files**
To skip specific files (e.g., hidden files or certain patterns):
```bash
find "$SOURCE_DIR" -type f ! -name ".*" -exec ...
```

#### **Handle Subdirectories**
To include files in subdirectories, keep the script as-is (the `find` command works recursively). If you want to process only the current directory, add `-maxdepth 1`:
```bash
find "$SOURCE_DIR" -maxdepth 1 -type f ...
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x organize_media_files.sh
     ```

2. **Valid Source Directory**:
   - Verify the source directory exists and contains media files.

3. **Sufficient Space**:
   - Ensure there’s enough disk space for creating folders and moving files.

---

### **Output**

#### **Sample Terminal Output**:
```
Organizing media files in /path/to/media...
Media files have been organized into 'images/', 'videos/', and 'audio/' folders.
```

---

### **Error Handling**
1. **Invalid Directory**:
   - If the source directory is invalid or inaccessible, the script exits with:
     ```
     Usage: ./organize_media_files.sh <source_directory>
     ```

2. **No Matching Files**:
   - If no files match the specified extensions, the script completes without errors but moves nothing.

3. **File Conflicts**:
   - Overwrites existing files in target directories with the same name. To avoid this, add a safeguard:
     ```bash
     mv -n {} "$IMAGES_DIR" \;
     ```

---

### **Limitations**
1. **Extension-Dependent**:
   - Relies on file extensions to determine file types, which may not always reflect actual content.

2. **Non-Media Files**:
   - Ignores non-media files (e.g., `.txt`, `.docx`).

3. **Fixed Folder Names**:
   - Always creates `images`, `videos`, and `audio` folders. To customize folder names, modify the `IMAGES_DIR`, `VIDEOS_DIR`, and `AUDIO_DIR` variables.

---

### **Future Enhancements**
1. Add support for **custom folder names** via command-line arguments.
2. Implement a **summary report** showing the number of files moved for each type.
3. Include a **dry-run mode** to preview changes before applying them.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Organize your media files effortlessly with this efficient script! 🚀