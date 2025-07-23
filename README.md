# rhel-hardening-rh7-8-9-96pts

This repository provides Ansible playbooks and roles to automate CIS hardening for RHEL 7, 8, and 9 systems. The project is structured to address multiple CIS controls, grouped into modular roles for easier management and customization.

## Directory Structure

- `Linux_hardening_V3.2/`
  - `Linux_hardening_7/`, `Linux_hardening_8/`, `Linux_hardening_9/`:  
    Each directory contains Ansible configuration files and roles specific to the respective RHEL version.
    - `ansible.cfg`: Ansible configuration file.
    - `inventory`: Inventory file listing target hosts.
    - `linux_hardening.yml`: Main playbook to apply all roles.
    - `mcx_hardening_role_1/` ... `mcx_hardening_role_6/`: Modular roles implementing CIS controls.
- `ref/`: Reference documentation and previously developed scripts.

## Usage & installation

1. **Install Ansible**  
   Ensure Ansible is installed on your control node:
   ```sh
   pip install ansible

2. Configure Inventory
Edit the inventory file in the desired RHEL version directory to list your target hosts.

3. Run the Playbook
Navigate to the appropriate directory and run:
ansible-playbook -i inventory linux_hardening.yml
   Replace `inventory` with the path to your inventory file if necessary.   

License
This project is for internal use as per client requirements. 
