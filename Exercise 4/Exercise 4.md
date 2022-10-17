# Exercise 4

## TASK: Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo.

### Steps:

- I ran the command below to update my package index: `sudo apt-get update`

- I install software-properties-common, which adds management for additional software sources: `sudo apt -y install software-properties-common`

- I install the repository ppa:ondrej/php, with the following command: `sudo add-apt-repository ppa:ondrej/php`

- I run the following command so my package manager can see the newly listed packages: `sudo apt -y insta php7.4`

- To check the version installed I run: `php -v` -- See output below:

![php7]()

