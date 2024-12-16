### **README: Monitor and Kill Top Processes Script**

---

#### **Script Name**: `monitor_and_kill_processes.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script displays the top 5 processes consuming the most CPU and memory on the system. It also provides an option to terminate a specific process by its PID (Process ID).

---

### **Usage**
```bash
./monitor_and_kill_processes.sh
```

- The script does not require any arguments.  

---

### **Features**
1. **Top Process Monitoring**:
   - Lists the top 5 processes by CPU and memory usage using the `ps` command.

2. **Interactive Process Termination**:
   - Allows the user to terminate a process by entering its PID.

3. **Error Handling**:
   - Ensures the PID entered is valid and provides feedback on success or failure of termination.

---

### **How It Works**
1. **Display Top Processes**:
   - Uses the `ps` command to list processes sorted by CPU and memory usage:
     ```bash
     ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
     ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
     ```

2. **Prompt for Process Termination**:
   - Prompts the user with the question:
     ```bash
     Do you want to kill any process? (y/n):
     ```

3. **Kill the Process**:
   - If the user chooses to terminate a process, they are asked to enter the PID. The script validates the PID and attempts to terminate the process using `kill -9`:
     ```bash
     kill -9 "$pid"
     ```

4. **Feedback**:
   - Provides a success message if the process is terminated or an error message otherwise.

---

### **Example Workflow**

#### **1. Display Top Processes**
When the script is run, it outputs:
```
Top 5 Processes by CPU Usage:
  PID  PPID CMD                         %MEM %CPU
  1234  1000 /usr/bin/python3           5.0  50.0
  5678  1000 /usr/bin/java              10.2 40.0
  ...

Top 5 Processes by Memory Usage:
  PID  PPID CMD                         %MEM %CPU
  5678  1000 /usr/bin/java              10.2 40.0
  1234  1000 /usr/bin/python3           5.0  50.0
  ...
```

---

#### **2. Terminate a Process**
If the user chooses `y`:
```
Do you want to kill any process? (y/n): y
Enter the PID of the process to kill: 1234
Process 1234 has been terminated.
```

If the user enters an invalid PID:
```
Enter the PID of the process to kill: abc
Invalid PID entered. Exiting.
```

---

### **Customizing the Script**

#### **Change the Number of Top Processes**
To display more or fewer processes, adjust the `head -n` value:
```bash
head -n 11  # Shows top 10 processes instead of 5
```

#### **Include Additional Process Information**
Modify the `ps` command to include more details, such as execution time:
```bash
ps -eo pid,ppid,cmd,%mem,%cpu,etime --sort=-%cpu | head -n 6
```

#### **Kill a Process Interactively**
To list processes dynamically and kill them interactively, use `top` or `htop`.

---

### **Prerequisites**
1. Ensure the script is executable:
   ```bash
   chmod +x monitor_and_kill_processes.sh
   ```

2. Verify you have the necessary permissions to terminate processes (e.g., `sudo` for system processes).

---

### **Error Handling**
1. **Invalid Input**:
   - Ensures the entered PID is numeric before attempting termination.
2. **Permission Errors**:
   - If the process cannot be killed due to insufficient permissions, the script outputs:
     ```
     Failed to terminate process <PID>.
     ```

3. **No Processes Terminated**:
   - If the user chooses not to terminate any processes:
     ```
     No processes were killed.
     ```

---

### **Limitations**
1. **Static Snapshot**:
   - The script displays a static list of processes at the time it is run. For real-time monitoring, use tools like `top` or `htop`.

2. **Kill Command**:
   - Uses `kill -9`, which forcefully terminates the process without cleanup. Use with caution.

3. **Limited Information**:
   - Displays only the top processes based on CPU and memory usage.

---

### **Future Enhancements**
1. Add an option to **filter processes** by user or process name.
2. Implement **real-time monitoring** with periodic updates.
3. Provide an option to send a gentler termination signal (e.g., `SIGTERM`) instead of `SIGKILL`.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Monitor and manage processes with ease! 🚀