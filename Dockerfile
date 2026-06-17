FROM debian:bullseye-slim

# Install Dante SOCKS5 server
RUN apt-get update && apt-get install -y dante-server && rm -rf /var/lib/apt/lists/*

# Create the proxy user (User: meow, Pass: meow)
RUN useradd -r -s /usr/sbin/nologin meow && echo "meow:meow" | chpasswd

# Write the Dante configuration file dynamically
RUN echo 'logoutput: stderr \n\
user.privileged: root \n\
user.unprivileged: nobody \n\
internal: 0.0.0.0 port = 1080 \n\
external: eth0 \n\
socksmethod: username \n\
clientmethod: none \n\
client pass { \n\
    from: 0.0.0.0/0 to: 0.0.0.0/0 \n\
    log: connect disconnect \n\
} \n\
socks pass { \n\
    from: 0.0.0.0/0 to: 0.0.0.0/0 \n\
    socksmethod: username \n\
    log: connect disconnect \n\
}' > /etc/danted.conf

# Expose SOCKS5 Port
EXPOSE 1080

# Start Dante in the foreground
CMD ["danted", "-f", "/etc/danted.conf"]

