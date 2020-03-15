# Orange

This subproject is a simple configuration for having a **pihole** installation in a PI-Device as a Docker service.

1. Deploy files into a remote device using ```deploy.sh```.
   1. You may be prompted for the key required variables unless you have a ```.secret``` file.
2. You should be logged remotelly (using SSH) into your device with the previous script execution.
3. Modify pihole.yaml with a proper password for the pihole webAdmin and the hostname.
4. Install docker and deploy the stacks using ```stack-deploy.sh```.
