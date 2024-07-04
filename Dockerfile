# Use the official nginx image from the Docker Hub
FROM nginx:alpine

# Copy a simple HTML file to the nginx web server directory
COPY app/index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
