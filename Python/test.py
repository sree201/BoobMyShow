import paramiko

def configure_ospf(hostname, username, password, ospf_config_commands):
    # Create an SSH client
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        # Connect to the network device
        ssh_client.connect(hostname, username=username, password=password)

        # Open an interactive shell session
        remote_conn = ssh_client.invoke_shell()

        # Send OSPF configuration commands
        for command in ospf_config_commands:
            remote_conn.send(command + '\n')
            time.sleep(1)  # Wait for the command to be executed

        # Close the connection
        ssh_client.close()
        print("OSPF configuration completed successfully.")
    except Exception as e:
        print(f"Failed to configure OSPF: {e}")

if __name__ == "__main__":
    hostname = "192.168.1.1"  # Replace with your network device's IP address
    username = "admin"        # Replace with your SSH username
    password = "password"     # Replace with your SSH password

    # List of OSPF configuration commands
    ospf_config_commands = [
        "configure terminal",
        "router ospf 1",
        "network 192.168.1.0 0.0.0.255 area 0",
        "end",
        "write memory"
    ]

    configure_ospf(hostname, username, password, ospf_config_commands)