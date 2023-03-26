# Exercise 3

## TASK 1: Create 3 groups – admin, support & engineering and add the admin group to sudoers.

### To carry out this task I took the following steps;
- Logged into my ubuntu virtual machine
- Gained root user priviledge by running the command `sudo su` which grants me administrative rights
- I ran the following commands to create the group:

`groupadd admin` -- Creates the `admin` group

`groupadd support` -- Creates the `support` group

`groupadd engineering` -- Creates the `engineering` group

To confirm the groups were successfully created, I ran the command: 

`tail /etc/group` -- See command output below

> ![tail /etc/group](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%203/etc_group.png)
<br>

## TASK 2: Create a user in each of the groups

### To carry out this task I took the following steps;
>While I'm still logged in as the root user

I ran the following commands to create users:

`adduser admin_user` -- Creates an admin user

`adduser support_user` -- Creates a support user

`adduser engineering_user` -- Creates an engineering user

I ran this command to confirm that the users were created successfully:

`tail /etc/passwd` --See command output below

> ![tail /etc/passwd](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%203/etc_passwd.png)
<br>

## TASK 3: Generate SSH keys for the user in the admin group

### To carry out this task I took the following steps;

- Switched from`root` to the `admin_user` usint the command `suso su`
- I ran the command `ssh-keygen` -- To generate the SSH keys for the user in the admin group














