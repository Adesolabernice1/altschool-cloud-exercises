## Exercise 7

### Task:

* Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file and at midnight it sends the content of the file to a specified email address, then starts over for the new day.

### Instruction:

- [ ] Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise.

#### For this exercise I carried out the following steps:

#### SCRIPT
1. I created a bash script to execute all neccessary commands in a predefined order. 
> Link here: [script](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%207/text.sh)

#### MAIL
For my machine to be able to send a mail I installed an SMTP server by running the following commands:
- `sudo apt update` &&
- `sudo apt install ssmtp`

I also installed a mail client by running the following commands:
- `sudo apt install bsd-mailx`

After installing the mail server and client, I made the necessary configurations to get them both working.
Most of the configuration was done by editing the `/etc/ssmtp/ssmtp.conf` and `/etc/ssmtp/revaliases` files.

Here's a screnshot of both configurations:
> /etc/ssmtp/ssmtp.conf
```ruby
vagrant@ubuntu:/$ cat /etc/ssmtp/ssmtp.conf
root=adesolabenice@gmail.com
mailhub=smtp.gmail.com:587
hostname=ubuntu
AuthUser=adesolabenice@gmail.com
AuthPass=**************** [This is my gmail app password]
UseSTARTTLS=yes
UseTLS=yes
FromLineOverride=yes
```


> /etc/ssmtp/revaliases
```ruby
vagrant@ubuntu:/$ cat /etc/ssmtp/revaliases

root:myemail@gmail.com:smtp.gmail.com:587
```

Note: 
- I tested if my vm could communicate with the outside world by pinging google.com
- I also tried to telnet the smtp server using: telnet smtp.gmail.com 587
> Ping and telnet both returned success

#### CRON
Next thing I did after writing my bash script and setting up my mail was to set up a cronjob. 

To carry this out I had to install a crontab since it was the first ever to be run on my vm.
With `crontab -e` I was able to create and edit my first crontab. I have attached my configuration below:

[cronjob](https://github.com/Adesolabernice1/altschool-cloud-exercises/blob/main/Exercise%207/cronjob)

#### Mail Output
[mail]()
