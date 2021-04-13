## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![The Network Diagram](/Diagrams/NetworkDiagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yaml file may be used to install only certain pieces of it, such as Filebeat.

[Pentest Playbook](/Ansible/pentest.yml)
[Filebeat Playbook](/Ansible/filebeat-playbook.yml)
[ELK Playbook](/Ansible/install-elk.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? What is the advantage of a jump box? Load balancers can be used to counter high-volume DDoS attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- What does Filebeat watch for? Filebeat monitors the Elasticsearch log files or locations that you specify, collects log events, and sends them Kibana
- What does Metricbeat record? Metricbeat records metrics from the operating system and from services running on the server, it then sends them to a place you specify.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| RedTeamVM | Jumpbox | 52.188.70.202   | Linux       |
| Web1     | DVWA  | 10.0.0.5   | Linux            |
| Web2     | DVWA  | 10.0.0.6   | Linux            |
| ELK      | ELK server | 10.1.0.4           | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the RedTeamVM machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- 173.238.163.6/32

Machines within the network can only be accessed by the jumpbox.

The ELK Machine is accessible to from the internet from my local host IP address. My local host IP can only access the dashboard at http://13.65.205.41:5601/app/kibana. Access from other IP addresses is only allowed through the RedTeam Security Group and the jump box virtual machine.  

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| LocalHost | No              | 173.238.***.*/32    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because of how easy it is to setup and configure multiple machines with the same baseline.

The playbook implements the following tasks:
- Downloads Docker
- Downloads and launches the ELK container.
- Enables Docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker PS Output](/Diagrams/Docker_ps_Output.JPG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

We have installed the following Beats on these machines:
- Web 1 (10.0.0.5)
- Web 2 (10.0.0.6)

These Beats allow us to collect the following information from each machine:

- Filebeat - collects data about the file system and logs Metricbeat - collects machine metrics, such as uptime

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the playbook files (Filebeat-playbook,ELK Playbook, Pentest Playbook) to the /etc/ansible folder. 
- Update the hosts file to include webserver IPs and ELK IP.
- Run the playbooks using the appropriate host groups, and navigate to http://13.65.205.41:5601/app/kibana to check that the installation worked as expected.

