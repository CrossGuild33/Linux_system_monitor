# Linux System Monitor using Bash

A simple Linux system monitor written in Bash that continuously monitors CPU, memory, and disk usage. The script displays the current resource usage every two seconds and generates alerts whenever a configurable threshold is exceeded.

---

## Features

- Continuous monitoring using a `while` loop
- CPU usage monitoring
- Memory usage monitoring
- Disk usage monitoring
- Configurable alert thresholds
- Colored alert messages
- Automatic screen refresh every 2 seconds

---

## Technologies

- Bash
- Linux
- awk
- grep
- top
- free
- df
- tput

---

## Project Structure

```
linux-system-monitor-bash/
│
├── README.md
├── system_monitor.sh
└── images/
    ├── 01-alert-function.png
    ├── 02-cpu-monitor.png
    ├── 03-memory-monitor.png
    ├── 04-disk-monitor.png
    └── 05-running-script.png
```

---

## Configurable Thresholds

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
```

The alert values can be changed according to your monitoring requirements.

---

## Alert Function

The script uses a reusable function to display alerts whenever a monitored resource exceeds the configured threshold.

```bash
send_alert "CPU" "$cpu_usage"
```

Example output:

```
ALERT: CPU usage exceeded threshold! Current value: 85%
```

![Alert Function](images/01-alert-function.png)

---

## CPU Monitoring

CPU utilization is obtained from the `top` command and processed using `grep` and `awk`.

```bash
top -bn1
```

![CPU Monitoring](images/02-cpu-monitor.png)

---

## Memory Monitoring

Memory usage is calculated from the `free` command.

```bash
free
```

![Memory Monitoring](images/03-memory-monitor.png)

---

## Disk Monitoring

Disk usage is collected from the root filesystem using:

```bash
df -h /
```

![Disk Monitoring](images/04-disk-monitor.png)

---

## Continuous Monitoring

Instead of executing only once, the monitor runs continuously inside a `while` loop.

Every two seconds the screen is cleared and updated with the latest resource usage.

```bash
while true
do
    clear
    echo "Resource Usage:"
    echo "CPU: $cpu_usage%"
    echo "Memory: $memory_usage%"
    echo "Disk: $disk_usage%"
    sleep 2
done
```

This creates a lightweight real-time system monitor directly in the Linux terminal.

---

## Example Output

```
Resource Usage:

CPU: 3%
Memory: 17%
Disk: 2%
```

When a threshold is exceeded:

```
ALERT: CPU usage exceeded threshold!
Current value: 85%
```

![Running Script](images/05-running-script.png)

---

## Linux Commands Used

| Command | Purpose |
|----------|---------|
| `top` | Monitor CPU usage |
| `free` | Display memory usage |
| `df` | Display disk usage |
| `awk` | Parse command output |
| `grep` | Filter command output |
| `tput` | Display colored alerts |
| `clear` | Refresh terminal screen |
| `sleep` | Control update interval |

---

## Skills Practiced

- Bash scripting
- Functions
- Variables
- Loops (`while`)
- Conditional statements
- Linux system monitoring
- Text processing with `awk` and `grep`
- Command substitution
- Terminal output formatting

---

## Future Improvements

- Log alerts to a file
- Send email notifications
- Monitor network usage
- Monitor running processes
- Add timestamps to alerts
- Export metrics to CSV
- Display system uptime

---

## Author

Julio Cesar Teixeira de Lima
