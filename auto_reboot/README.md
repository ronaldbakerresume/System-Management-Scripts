### **README: Automatic Resource Monitoring and Reboot Script**

---

#### **Script Name**: `auto_reboot_on_high_usage.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script monitors system resource usage (CPU and Memory) at regular intervals and logs the usage stats. If resource usage exceeds defined thresholds, it automatically schedules a system reboot to mitigate potential issues.  

The script is ideal for servers or systems that need to stay operational and recover from high resource utilization autonomously.

---

### **Usage**
```bash
./auto_reboot_on_high_usage.sh
```

---

### **Features**
1. **Resource Monitoring**:
   - Monitors CPU and Memory usage in real-time.
   - Logs usage statistics to a file (`$HOME/auto_reboot.log`).

2. **Threshold-Based Reboot**:
   - Automatically schedules a reboot if CPU or Memory usage exceeds predefined thresholds.

3. **Customizable Thresholds**:
   - Modify the `CPU_THRESHOLD` and `MEM_THRESHOLD` variables in the script to set custom thresholds.

4. **Interval Monitoring**:
   - Runs in an infinite loop, checking resource usage every 5 seconds (default).

---

### **Example Scenarios**

#### **Case 1: CPU Usage Exceeds Threshold**
- **Threshold**: `CPU_THRESHOLD=90`
- If CPU usage exceeds 90%, the script:
  - Logs the alert in the log file.
  - Schedules a system reboot.

#### **Case 2: Memory Usage Exceeds Threshold**
- **Threshold**: `MEM_THRESHOLD=90`
- If Memory usage exceeds 90%, the script:
  - Logs the alert in the log file.
  - Schedules a system reboot.

---

### **Log File**
**Path**: `$HOME/auto_reboot.log`  
The log file captures:
1. CPU and Memory usage at each monitoring interval.
2. Alerts when thresholds are exceeded.
3. Reboot scheduling messages.

**Sample Log Output**:
```
2023-12-15 12:00:01 - CPU: 85.5%, Memory: 78.2%
2023-12-15 12:00:06 - CPU: 92.1%, Memory: 81.0%
2023-12-15 12:00:06 - ALERT: Resource usage exceeded thresholds!
2023-12-15 12:00:06 - Resource usage critical. Scheduling a reboot...
```

---

### **Customizing the Script**
1. **Set Custom Thresholds**:
   - Edit these lines to define your own thresholds:
     ```bash
     CPU_THRESHOLD=90  # Percentage
     MEM_THRESHOLD=90  # Percentage
     ```

2. **Adjust Monitoring Interval**:
   - Modify the `sleep` duration in the `while` loop to change the monitoring interval:
     ```bash
     sleep 5  # Check usage every 5 seconds
     ```

3. **Reboot Message**:
   - Update the reboot message in the `schedule_reboot` function:
     ```bash
     sudo shutdown -r +1 "Rebooting due to high resource usage."
     ```

---

### **Prerequisites**
1. **Permissions**:
   - The script requires `sudo` privileges to schedule a reboot.
2. **Install `bc`** (if not already installed):
   - The script uses `bc` for floating-point arithmetic. Install it with:
     ```bash
     sudo apt install bc  # For Debian/Ubuntu
     sudo yum install bc  # For CentOS/Red Hat
     ```

---

### **How It Works**
1. **CPU Monitoring**:
   - Uses the `top` command to calculate CPU usage.
   - Subtracts idle percentage (`%id`) from 100 to get active usage.

2. **Memory Monitoring**:
   - Uses the `free` command to calculate memory usage as a percentage of total memory.

3. **Reboot Scheduling**:
   - If usage exceeds thresholds, schedules a reboot using:
     ```bash
     sudo shutdown -r +1
     ```
   - Logs the action in the log file.

---

### **Error Handling**
- The script logs errors related to `shutdown` or `sudo` commands in the log file.
- Ensures CPU and Memory usage are properly parsed before comparison.

---

### **Limitations**
1. **Monitoring Interval**:
   - The default 5-second interval may not suit all use cases; adjust `sleep` accordingly.
2. **Hardcoded Log File**:
   - The log file location is set to `$HOME/auto_reboot.log`. Customize it as needed.
3. **Reboot Trigger**:
   - A reboot is always scheduled if thresholds are exceeded. For alternative responses (e.g., kill high-usage processes), the script must be modified.

---

### **Future Enhancements**
1. Implement notifications (email or SMS) instead of directly scheduling a reboot.
2. Add a dry-run mode to log potential reboots without actually scheduling them.
3. Include monitoring for additional metrics, such as disk I/O or network usage.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Automate your system recovery with ease! 🚀