#SSH - secure shell
 Secure shell - remote server login for configuration

##steps for configuration
 generate key pairs
 $ ssh-keygen -t <typeieRSA>
 copy the public key to the server
 private key should be kept private and should never travel through network
 copying key can b done using ssh-copy-id username@host
 where username is remete username and hostname  is ip address of the server
 $ ssh-copy-id ubuntu@33.45.656.67
 if default file for storing keys are change specify copy the key to the server as follows
 $ cat <publikey.pub> | ssh ubuntu@33.45.656.67 "cat >> ~/.ssh/authorized_keys"
 public keys are copied by default to ~/.ssh/authorized_keys files
 conection to the server
 if default file loacation is used conection is done via
 $ ssh <username>@<hostaddress>
 if default default key pair was changed during creation, provide path to identity file
 $ ssh -i <private_key_file> <username>@<hostaddress>
 To avoid providing path to private key evrtime connection is to be made
 edit the ~/.ssh/config file under host namt to connect to add
 > IdentityFile <path_to_private_key>

##once connected
 once conected user is dropped to shell sessio where once can execute commands,
 and server management
 to exit type exit
