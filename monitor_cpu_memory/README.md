### **README: CPU and Memory Usage Monitor Script**

---

#### **Script Name**: `monitor_cpu_memory.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script monitors CPU and memory usage in real-time and logs the data to a file. It also alerts when usage exceeds predefined thresholds. This tool is ideal for tracking system performance and identifying resource bottlenecks.

---

### **Usage**
```bash
./monitor_cpu_memory.sh
```

- **No arguments required**.  

---

### **Features**
1. **Real-Time Monitoring**:
   - Continuously monitors CPU and memory usage.

2. **Threshold Alerts**:
   - Logs alerts when CPU or memory usage exceeds configurable thresholds.

3. **Logging**:
   - Saves usage data to a log file (`cpu_memory_usage.log`) with timestamps.

4. **Customizable Thresholds**:
   - Default thresholds: 
     - **CPU**: 80%  
     - **Memory**: 80%  

5. **Graceful Exit**:
   - Run indefinitely until interrupted with `Ctrl+C`.

---

### **How It Works**
1. **Resource Monitoring**:
   - **CPU Usage**:
     - Extracted from the `top` command:
       ```bash
       CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
       ```
       Represents the percentage of CPU in use.
   - **Memory Usage**:
     - Calculated using the `free` command:
       ```bash
       MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
       ```
       Represents the percentage of memory in use.

2. **Logging**:
   - Appends current CPU and memory usage to a log file with timestamps:
     ```bash
     echo "$TIMESTAMP - CPU: $CPU_USAGE%, Memory: $MEM_USAGE%" >> "$LOGFILE"
     ```

3. **Threshold Alerts**:
   - Checks if CPU or memory usage exceeds predefined thresholds. If so, logs an alert:
     ```bash
     if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
         echo "ALERT: CPU usage exceeded $CPU_THRESHOLD% at $TIMESTAMP!" >> "$LOGFILE"
     fi
     ```

4. **Continuous Monitoring**:
   - Repeats the process every second using an infinite loop.

---

### **Example Output**

#### **Log File (`cpu_memory_usage.log`)**:
```
2023-12-15 10:45:00 - CPU: 45.5%, Memory: 72.3%
2023-12-15 10:45:01 - CPU: 83.2%, Memory: 80.5%
ALERT: CPU usage exceeded 80% at 2023-12-15 10:45:01!
ALERT: Memory usage exceeded 80% at 2023-12-15 10:45:01!
2023-12-15 10:45:02 - CPU: 60.3%, Memory: 79.0%
```

---

### **Customizing the Script**

#### **Change Thresholds**
Adjust the CPU and memory usage thresholds by modifying these variables:
```bash
CPU_THRESHOLD=90
MEM_THRESHOLD=85
```

#### **Adjust Monitoring Interval**
Change the delay between checks by modifying the `sleep` command:
```bash
sleep 5  # Check every 5 seconds instead of 1 second
```

#### **Change Log File Name**
Specify a different log file name:
```bash
LOGFILE="/path/to/custom_logfile.log"
```

#### **Filter Specific Processes**
Incorporate `ps` or `top` to monitor specific processes consuming the most resources:
```bash
ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head -n 5
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x monitor_cpu_memory.sh
     ```

2. **Commands**:
   - Requires `top`, `free`, and `bc`, which are typically installed by default on most Linux distributions.

---

### **Output**
- Logs CPU and memory usage with timestamps in `cpu_memory_usage.log`.  
- Alerts are added to the log when thresholds are exceeded:
  ```
  ALERT: CPU usage exceeded 80% at <timestamp>!
  ALERT: Memory usage exceeded 80% at <timestamp>!
  ```

---

### **Error Handling**
1. **Invalid Commands**:
   - If `top`, `free`, or `bc` is missing, the script will fail. Install missing commands using:
     ```bash
     sudo apt install procps bc   # Ubuntu/Debian
     sudo yum install procps-ng bc  # Red Hat/CentOS
     ```

2. **Permissions**:
   - Ensure the script has write permissions for the log file directory.

---

### **Limitations**
1. **Single-User Monitoring**:
   - Tracks overall system resource usage, not per-user or per-process.
   
2. **High Resource Consumption**:
   - Running the script continuously may add minimal CPU and memory overhead.

3. **Fixed Thresholds**:
   - Alerts are based on static thresholds. Dynamic thresholds based on historical data are not implemented.

---

### **Future Enhancements**
1. Add an option for **real-time graphs** or a dashboard.
2. Implement **email or SMS notifications** for alerts.
3. Extend support for **per-process monitoring** or tracking specific applications.
4. Include **disk usage monitoring** alongside CPU and memory.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Stay on top of your system performance with ease! 🚀