# Use the official lightweight Alpine image.
# https://hub.docker.com/_/alpine
FROM alpine:latest

# Set the working directory to /app.
WORKDIR /app

# Install Lua and LuaSocket.
RUN apk add --no-cache lua-dev lua-socket

# Copy the http.lua and lib folder to the container.
COPY main.lua http.lua /app/
COPY lib/ /app/lib/

# Expose port 3000.
EXPOSE 3000

# Run main.lua on port 3000.
CMD ["lua", "main.lua"]
