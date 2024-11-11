# Ansible

## Getting Started

To execute ansible, follow the next steps:

_Note: We use Vault to encrypt sensitive information, to run these playbooks you can [generate your own variable file](https://docs.ansible.com/ansible/2.8/user_guide/vault.html#:~:text=Ansible%20Vault%20is%20a%20feature,or%20placed%20in%20source%20control.) or ask the [prodsupport team](prodsupport@axosbank.com) for the password._ 

1.	Install Windows Subsystem for linux
    - Contact IT for support or read the [documentation](https://learn.microsoft.com/en-us/windows/wsl/install).

2. Install Ubuntu: When working whit last version found issues, install that works

<ins>Check valid distros</ins>

It always helps to know wich distros you can install

```powershell
wsl --list -o
```
<ins>Insall Ubuntu</ins>

```powershell
wsl --install -d Ubuntu-20.04
```

2.	Install [Ansible in your WSL system](https://docs.ansible.com/ansible/latest/os_guide/windows_faq.html).

````shell
sudo apt-get update
sudo apt-get install python3-pip git libffi-dev libssl-dev -y
pip install --user ansible pywinrm
````

<ins>Errors: First possible error you may encounter</ins>

On step `pip install --user ansible pywinrm` found some errors or blockers for SSL connection (Maybe because Palo Alto Firewalls add their SSL certificates between connections to decrypt traffic)

<ins>By pass</ins>

```shell
pip install --user ansible --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org pywinrm
```

<ins>Errors: Second possible error you may encounter</ins>

When installing ansible there is a warning like this

![errors_second_possible_error](assets/errors_second_possible_error.PNG)

Hence you can't use ansible 

<ins>Fix</ins>

Add to path

```shell
echo $PATH #Check Path Understand what are you doing
export PATH="/home/dsalvatierra/.local/bin:$PATH"
echo $PATH
# Test
ansible --version
```

3. Edit your ansible.cfg and add your `roles` path.

````shell
roles_path=/home/User/.ansible/roles
````

**Note**: This is in your WSL environment, if it is Ubuntu `/etc/ansible/ansible.cfg`

4. `inventory` files are on [inventories](/inventories/) directories.

## Vault commands

### Encrypting Files

```shell
ansible-vault encrypt foo.yml bar.yml baz.yml
```

### Decrypting Encrypted Files

```shell
ansible-vault decrypt foo.yml bar.yml baz.yml
```

### Viewing Encrypted Files

```shell
ansible-vault view foo.yml bar.yml baz.yml
```


## Releated Documentation

- https://www.ansible.com

