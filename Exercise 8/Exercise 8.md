### Exercise 8

#### Task:

- Create an Ansible Playbook to setup a server with Apache
- The server should be set to the Africa/Lagos Timezone
- Host an index.php file with the following content, as the main file on the server:
```php
<?php
date("F d, Y h:i:s A e", time());
?>
```
#### Instruction:

 * [ ] Submit the Ansible playbook, the output of systemctl status apache2 after deploying the playbook and a screenshot of the rendered page



#### Procedure
- I installed ansible on the controlling machine or node

### Inventory
- Created a new inventory file named inventory.yaml in my home directory
- Added my server to the inventory file by adding it's IP address to the file

Inventory file:
[inventory]()

Verify your inventory. If you created your inventory in a directory other than your home directory, specify the full path with the -i option.

- I verified my inventory by running the command: `ansible-inventory -i inventory.yaml --list`

Output Below:
```ruby
vagrant@local:/etc/ansible$ ansible-inventory inventory.yaml --list
{
    "_meta": {
        "hostvars": {}
    },
    "all": {
        "children": [
            "ungrouped"
        ]
    },
        "hosts": [
            "192.168.56.7"
        ]
}
```

- Pinged the managed node in my inventory using: `ansible all -m ping -i inventory.yaml`


Output Below:
```ruby
vagrant@local:~$ ansible servers -m ping -i inventory.yaml
amazon-server | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

Then I perfomed a dry run by issuing the command: `ansible-playbook playbook.yaml --check`

> Note:  This is used when creating or editing a playbook or role to know what it will do. In check mode, Ansible runs without making any changes on remote systems. Modules that support check mode report the changes they would have made and modules that do not support check mode report nothing and do nothing.

Output Here;

```ruby

```

###### Intial output of the timezonectl before modification by the ansible controller:
```bash
vagrant@remote:~$ cat /etc/timezone
America/Aruba
```

##### Final output of timezonectl:
```bash
vagrant@remote:~$ cat /etc/timezone
Africa/Lagos
```
