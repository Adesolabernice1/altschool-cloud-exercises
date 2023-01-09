# Exercise 6

### Task: 
Review the CIS benchmark for ubuntu and try to implement at least 10 of the recommendations that has been made within the benchmark

I picked 12 recommendations from the following:

1. Initial Setup
2. Services
3. Network Configuration
4. Logging and Auditing
5. Access, Authentication and Authorization
6. System Maintenance

- I ensured i was logged in the root user while performing all operations.

## 1. INITIAL SETUP

### 1.1 Filesystem Configuration

For the purpose of this benchmark, the requirement is to ensure that directories used for system-wide functions can be further protected by placing them on separate partitions. This provides protection for resource exhaustion and enables the use of mounting options that are applicable to the directory's intended use. 

### 1.2.1 Ensure package manager repositories are configured (Manual)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.

### Rationale:
If a system's package repositories are misconfigured important patches may not be
identified or a rogue repository could introduce compromised software.

### Audit:
Run the following command and verify package repositories are configured correctly:

`apt-cache policy`

#### Output:

![apt-cache policy](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/apt-cache%20policy.png)

### 1.5.3 Ensure prelink is not installed (Automated)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
prelink is a program that modifies ELF shared libraries and ELF dynamically linked
binaries in such a way that the time needed for the dynamic linker to perform relocations at startup significantly decreases.

### Rationale:
The prelinking feature can interfere with the operation of AIDE, because it changes
binaries. Prelinking can also increase the vulnerability of the system if a malicious user is able to compromise a common library such as libc.

### Audit:
Verify prelink is not installed:

`dpkg -s prelink | grep -E`

#### Output:

![prelink](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/prelink.png)

## 2. SERVICES
### 2.1 Special Purpose Services
This section describes services that are installed on systems that specifically need to run these services. If any of these services are not required, it is recommended that they be deleted from the system to reduce the potential attack surface. If a package is required as a dependency, and the service is not required, the service should be stopped and masked.

### 2.1.3 Ensure Avahi Server is not installed (Automated)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD
service discovery. Avahi allows programs to publish and discover services and hosts
running on a local network with no specific configuration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine.

### Rationale:
Automatic discovery of network services is not normally required for system functionality.
It is recommended to remove this package to reduce the potential attack surface.

### Audit:
Run the following command to verify avahi-daemon is not installed:

`dpkg -s avahi-daemon | grep -E`

#### Output:

![avahi-daemon](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/avahi-daemon.png)

### 2.2 Service Clients
A number of insecure services exist. While disabling the servers prevents a local attack against these services, it is advised to remove their clients unless they are required

### 2.2.1 Ensure NIS Client is not installed (Automated)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
The Network Information Service (NIS), formerly known as Yellow Pages, is a client-server directory service protocol used to distribute system configuration files. The NIS client was used to bind a machine to an NIS server and receive the distributed configuration files.

### Rationale:
The NIS service is inherently an insecure system that has been vulnerable to DOS attacks, buffer overflows and has poor authentication for querying NIS maps. NIS generally has been replaced by such protocols as Lightweight Directory Access Protocol (LDAP). It is recommended that the service be removed.

### Impact:
Many insecure service clients are used as troubleshooting tools and in testing
environments. Uninstalling them can inhibit capability to test and troubleshoot. If they are required it is advisable to remove the clients after use to prevent accidental or intentional misuse.

### Audit:
Verify nis is not installed. Use the following command to provide the needed information:

`dpkg -s nis | grep -E`

#### Output:

![nis](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/nis.png)

## 3. NETWORK CONFIGURATION

### 3.4 Uncommon Network Protocols
The Linux kernel modules support several network protocols that are not commonly used. If these protocols are not needed, it is recommended that they be disabled in the kernel.
### 3.4.3 Ensure RDS is disabled (Automated)

### Profile Applicability:
 Level 2 - Server
 Level 2 - Workstation

### Description:
The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide low-latency, high-bandwidth communications between cluster nodes. It was
developed by the Oracle Corporation.

### Rationale:
If the protocol is not being used, it is recommended that kernel module not be loaded, disabling the service to reduce the potential attack surface.

### Audit:
Run the following commands and verify the output is as indicated:

`modprobe -n -v rds`
`lsmod | grep rds`

#### Output:

![rds](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/rds.png)

### 3.5 Firewall Configuration
A firewall is a set of rules. When a data packet moves into or out of a protected network space, its contents (in particular, information about its origin, target, and the protocol it plans to use) are tested against the firewall rules to see if it should be allowed through.

###### For the purpose of this benchmark note that:
- Only one method should be used to configure a firewall on the system. Use of more than one method could produce unexpected results.
- This section is intended only to ensure the resulting firewall rules are in place, not how they are configured.

### 3.5.1.1 Ensure ufw is installed (Automated)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
The Uncomplicated Firewall (ufw) is a frontend for iptables and is particularly well-suited for host-based firewalls. ufw provides a framework for managing netfilter, as well as a command-line interface for manipulating the firewall

### Rationale:
A firewall utility is required to configure the Linux kernel's netfilter framework via the iptables or nftables back-end.
The Linux kernel's netfilter framework host-based firewall can protect against threats originating from within a corporate network to include malicious mobile code and poorly configured software on a host.

#### Note: Only one firewall utility should be installed and configured. UFW is dependent on the iptables package

### Audit:

Run the following command to verify that Uncomplicated Firewall (UFW) is installed:

`dpkg -s ufw | grep`
`apt install ufw`

#### Output:

![ufw](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/ufw.png)

## 4. LOGGING AND AUDITING
System auditing, through auditd, allows system administrators to monitor their systems such that they can detect unauthorized access or modification of data. By default, auditd will audit AppArmor AVC denials, system logins, account modifications, and authentication events. Events will be logged to `/var/log/audit/audit.log`. The recording of these events will use a modest amount of disk space on a system. If significantly more events are captured, additional on system or off system storage may need to be allocated.

#### Notes:
- The recommendations in this section implement an audit policy that produces large quantities of logged data
- In some environments it can be challenging to store or process these logs and as such they are marked as Level 2 for both Servers and Workstations
- Audit rules that have `arch` as a rule parameter:
     - On 64 bit systems, you will need two rules, one for 64 bit and one for 32 bit
     - On 32 bit systems, only the 32 bit rule is needed
     
 ### 4.1.1.1 Ensure auditd is installed (Automated)

### Profile Applicability:
- Level 2 - Server
- Level 2 - Workstation

### Description:
auditd is the userspace component to the Linux Auditing System. It's responsible for writing audit records to the disk

### Rationale:
The capturing of system events provides system administrators with information to allow them to determine if unauthorized access to their system is occurring.

### Audit:
Run the following command and verify auditd is installed:

`dpkg -s auditd audispd-plugins`

#### Output:

![auditd](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/auditd.png)
    
### 4.1.1.2 Ensure auditd service is enabled (Automated)

### Profile Applicability:
 Level 2 - Server
 Level 2 - Workstation

### Description:
Enable and start the auditd daemon to record system events.

### Rationale:
The capturing of system events provides system administrators with information to allow them to determine if unauthorized access to their system is occurring.

### Audit:
Run the following command to verify auditd is enabled:

`systemctl is-enabled auditd`

#### Output:

![enable_auditd](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/enable_auditd.png)

## 5. ACCESS, AUTHENTICATION AND AUTHORIZATION

### 5.1 Configure time-based job schedulers
cron is a time-based job scheduler used to schedule jobs, commands or shell scripts, to run periodically at fixed times, dates, or intervals.
at provides the ability to execute a command or shell script at a specified date and hour, or after a given interval of time.

#### Notes:
- Other methods exist for scheduling jobs, such as systemd timers. If another method is used, it should be secured in accordance with local site policy

### 5.1.1 Ensure cron daemon is enabled and running (Automated)

### Profile Applicability:
- Level 1 - Server
- Level 1 - Workstation

### Description:
The cron daemon is used to execute batch jobs on the system.

#### Note:
Other methods, such as systemd timers, exist for scheduling jobs. If another method is used, cron should be removed, and the alternate method should be secured in accordance with local site policy

### Rationale:
While there may not be user jobs that need to be run on the system, the system does have maintenance jobs that may include security monitoring that have to run, and cron is used to execute them.

### Audit:
Run the following command to verify cron is enabled:

`systemctl is-enabled cron'

#### Output:

![cron_daemon](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/cron%20daemon.png)

### 5.2 Configure sudo
sudo allows a permitted user to execute a command as the superuser or another user, as
specified by the security policy. The invoking user's real (not effective) user ID is used to
determine the user name with which to query the security policy.
sudo supports a plugin architecture for security policies and input/output logging. Third parties can develop and distribute their own policy and I/O logging plugins to work seamlessly with the sudo front end. The default security policy is sudoers, which is configured via the file /etc/sudoers.

### 5.2.1 Ensure sudo is installed (Automated)

### Profile Applicability:
 Level 1 - Server
 Level 1 - Workstation

### Description:
sudo allows a permitted user to execute a command as the superuser or another user, as specified by the security policy. The invoking user's real (not effective) user ID is used to determine the user name with which to query the security policy.

#### Note: 
Use the sudo-ldap package if you need LDAP support for sudoers

### Rationale:
sudo supports a plugin architecture for security policies and input/output logging. Third parties can develop and distribute their own policy and I/O logging plugins to work seamlessly with the sudo front end. The default security policy is sudoers, which is configured via the file /etc/sudoers.
The security policy determines what privileges, if any, a user has to run sudo. The policy may require that users authenticate themselves with a password or another authentication mechanism. If authentication is required, sudo will exit if the user's password is not entered within a configurable time limit. This limit is policy-specific.

### Audit:
Verify that sudo in installed.
Run the following command and inspect the output to confirm that sudo is installed:

`dpkg -s sudo`

#### Output:

![sudo](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/sudo.png)

## 6. SYSTEM MAINTENANCE

### 6.1 System File Permissions
This section provides guidance on securing aspects of system files and directories.

### 6.1.2 Ensure permissions on /etc/passwd are configured (Automated)

### Profile Applicability:
- Level 1 - Server
- Level 1 - Workstation

### Description:
The `/etc/passwd` file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate.

### Rationale:
It is critical to ensure that the `/etc/passwd` file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions.

### Audit:
Run the following command and verify Uid and Gid are both `0/root` and Access is `644`:

`stat /etc/passwd`

#### Output:

![permission_etc passwd](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/permission_on_etc%20passwd.png)

### 6.2 User and Group Settings
This section provides guidance on securing aspects of the users and groups.

#### Note:
The recommendations in this section check local users and groups. Any users or groups from other sources such as LDAP will not be audited. In a domain environment similar checks should be performed against domain users and groups.

### 6.2.1 Ensure accounts in `/etc/passwd` use shadowed passwords (Automated)

### Profile Applicability:
- Level 1 - Server
- Level 1 - Workstation

### Description:
Local accounts can uses shadowed passwords. With shadowed passwords, The passwords are saved in shadow password file, `/etc/shadow`, encrypted by a salted one-way hash. Accounts with a shadowed password have an x in the second field in `/etc/passwd`.

### Rationale:
The `/etc/passwd` file also contains information like user ID's and group ID's that are used by many system programs. Therefore, the /etc/passwd file must remain world readable. In spite of encoding the password with a randomly-generated one-way hash function, an attacker could still break the system if they got access to the `/etc/passwd` file. This can be mitigated by using shadowed passwords, thus moving the passwords in the `/etc/passwd` file to `/etc/shadow`. The `/etc/shadow` file is set so only root will be able to read and write. This helps mitigate the risk of an attacker gaining access to the encoded passwords with which to perform a dictionary attack.

#### Notes:
- All accounts must have passwords or be locked to prevent the account from being used by an unauthorized user.
- A user account with an empty second field in /etc/passwd allows the account to be logged into by providing only the username.

### Audit:
Run the following command and verify that no output is returned:

`awk -F: '($2 != "x" ) { print $1 " is not set to shadowed passwords "}' /etc/passwd`

#### Output:

![group_etc passwd](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%206/group_on_etc%20passwd.png)
     
     
     




