### **README: Network Connectivity Monitor Script**

---

#### **Script Name**: `network_monitor.sh`  
**Developer**: Ronald Baker  

---

### **Overview**
This script monitors the network connectivity to a specified host by pinging it periodically. If the host becomes unreachable, a downtime event is logged with a timestamp in a log file.

---

### **Usage**
```bash
./network_monitor.sh [host]
```

- **`[host]`**: The hostname or IP address to monitor (optional). Defaults to `google.com`.  

---

### **Features**
1. **Real-Time Connectivity Monitoring**:
   - Continuously pings the host and checks its availability.

2. **Downtime Logging**:
   - Logs each downtime event with a timestamp in `network_downtime_<YYYYMMDD>.log`.

3. **Customizable Host**:
   - Allows monitoring any host or IP address.

4. **Flexible Monitoring Interval**:
   - Checks connectivity every 5 seconds by default.

---

### **How It Works**
1. **Input Validation**:
   - Defaults to `google.com` if no host is provided:
     ```bash
     HOST=${1:-"google.com"}
     ```

2. **Ping Host**:
   - Uses the `ping` command to test connectivity. If the host is unreachable, logs an alert:
     ```bash
     if ! ping -c 1 -W 1 "$HOST" &> /dev/null; then
         TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
         echo "$TIMESTAMP - Network unreachable for $HOST" | tee -a "$LOGFILE"
     fi
     ```

3. **Downtime Logging**:
   - Saves downtime events to a daily log file named `network_downtime_<YYYYMMDD>.log`.

4. **Repeat**:
   - The script runs indefinitely, checking connectivity every 5 seconds:
     ```bash
     sleep 5
     ```

---

### **Example Usages**

#### **1. Monitor Default Host (google.com)**
```bash
./network_monitor.sh
```
- Continuously monitors connectivity to `google.com`.  
- Logs downtime events in `network_downtime_<YYYYMMDD>.log`.

---

#### **2. Monitor a Custom Host**
```bash
./network_monitor.sh 192.168.1.1
```
- Monitors connectivity to the local router (192.168.1.1).  
- Logs downtime in the daily log file.

---

### **Customizing the Script**

#### **Change Monitoring Interval**
Modify the `sleep` duration to adjust the frequency of checks:
```bash
sleep 10 # Check every 10 seconds instead of 5
```

#### **Custom Log File Location**
Specify a different directory for the log file:
```bash
LOGFILE="/var/log/network_downtime_$(date '+%Y%m%d').log"
```

#### **Include Additional Actions**
Add a notification or alert mechanism during downtime, such as sending an email:
```bash
if ! ping -c 1 -W 1 "$HOST" &> /dev/null; then
    echo "$TIMESTAMP - Network unreachable for $HOST" | tee -a "$LOGFILE"
    mail -s "Network Downtime Alert" admin@example.com <<< "Host $HOST is unreachable as of $TIMESTAMP."
fi
```

---

### **Prerequisites**
1. **Executable Permissions**:
   - Ensure the script is executable:
     ```bash
     chmod +x network_monitor.sh
     ```

2. **Ping Utility**:
   - Ensure the `ping` command is available. It is typically pre-installed on most Linux distributions.

3. **Email Notifications**:
   - To send email alerts, configure the `mail` utility:
     ```bash
     sudo apt install mailutils  # Debian/Ubuntu
     sudo yum install mailx      # Red Hat/CentOS
     ```

---

### **Output**

#### **Sample Output in Terminal**:
```
Monitoring network connectivity to google.com...
Downtime events will be logged to network_downtime_20231215.log.
2023-12-15 10:45:00 - Network unreachable for google.com
2023-12-15 10:45:05 - Network unreachable for google.com
```

#### **Sample Log File (`network_downtime_20231215.log`)**:
```
2023-12-15 10:45:00 - Network unreachable for google.com
2023-12-15 10:45:05 - Network unreachable for google.com
```

---

### **Error Handling**
1. **Invalid Host**:
   - If the host is invalid or unreachable, the script logs:
     ```
     2023-12-15 10:45:00 - Network unreachable for <host>
     ```

2. **Permissions**:
   - Ensure the script has write permissions for the directory where the log file is saved.

---

### **Limitations**
1. **Fixed Monitoring Interval**:
   - Currently, the interval is hardcoded. To make it configurable, accept an optional interval argument:
     ```bash
     INTERVAL=${2:-5}
     sleep "$INTERVAL"
     ```

2. **Host-Specific Downtime**:
   - Only monitors a single host at a time. To monitor multiple hosts, run the script in parallel or modify it for multi-host monitoring.

3. **High Latency Detection**:
   - Does not log high latency, only unreachable hosts.

---

### **Future Enhancements**
1. Add **latency monitoring** and log high-latency events.
2. Implement support for monitoring **multiple hosts** simultaneously.
3. Provide a **summary report** of uptime and downtime statistics.
4. Integrate with **notification services** like Slack or SMS alerts.

---

### **License**
This script is free to use and modify. Attribution to Ronald Baker is appreciated.

---

Keep track of your network connectivity with confidence! 🚀