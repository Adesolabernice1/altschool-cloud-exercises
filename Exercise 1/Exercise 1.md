# Exercise 1
### Task: Setup Ubuntu 20.04 LTS on your local machine using Vagrant

### Instruction: 

- Customize your Vagrantfile as necessary with private_network set to dhcp
- Once the machine is up, run ifconfig and share the output in your submission along with your Vagrantfile in a folder for this exercise.

### Solution

1. I installed oracle virtualbox and vagrant
2. I created a folder for my vagrant exercise
3. I initialized vagrant in my folder by running the command `vagrant init ubuntu/focal64` and this created a vagrantfile in my project folder
4. I customized my vagrantfile by changing the private network to `dhcp`
5. I ran `vagrant up` to create my ubuntu virtual machine
6. Once the machine was booted and ready I ran `vagrant ssh` to access my virtual machine
7. After I logged into the machine I ran `ifconfig` to confirm that my private network customization was successful.

Below is the output of my `ifconfig`

![ifconfig output](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%201/IFCONFIG.png)
