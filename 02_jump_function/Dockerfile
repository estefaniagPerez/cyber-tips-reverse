FROM ubuntu:latest

# Install any build tools needed for your C program.
RUN apt-get update && apt-get install -y \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Set our working directory.
WORKDIR /app

# Copy everything (Makefile, source files) into /app.
COPY . /app

# Build the program using the Makefile (assumes 'jump_function' is produced).
RUN make

# By default, just run the program. We don't expose any ports.
CMD ["./jump_function.sh"]
