# Use the official Caddy image as the base image
FROM caddy:2.6-alpine

# Install LuaSocket and other dependencies from the Alpine package repository
RUN apk add --no-cache lua-dev lua-socket

# Set the working directory to /app
WORKDIR /app

# Copy the Caddyfile to the working directory
COPY Caddyfile /etc/caddy/Caddyfile

# Copy the Lua scripts and library directory to the working directory
COPY main.lua http.lua /app/
COPY lib/ /app/lib/

# Expose port 80 for the Caddy server
EXPOSE 80

# Set the entrypoint to run your Lua script
ENTRYPOINT ["lua", "main.lua"]

