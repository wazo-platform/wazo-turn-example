# TURN setup example

Those are examples about setting up your own STUN/TURN server.

Running them requires [Vagrant](https://www.vagrantup.com/) & [VirtualBox](https://www.virtualbox.org/).

Optionaly you can `vagrant plugin install vagrant-hostmanager`, it'll ask password like sudo to add the instance as "turn" in your host file.

## Bash setup

Vagrant will start the virtual machine, then run the `setup.sh` script

```
cd manual
vagrant up
```

## Ansible setup

Vagrant will start the virtual machine, then run `ansible-playbook` with the `playbook.yml`

```bash
cd ansible
vagrant up
```

## Test

A small NodeJS based client is provided for a quick test. It requires  `vagrant-hostmanager` as explained above, and `curl`.

Here's a full example running it, to be run on any Linux with curl installed.


```bash
# Install NodeJS & NPM through NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# Install required "stun" library
npm install stun
# Test "turn" server on port "3478"
./stun_client.js turn 3478
```
