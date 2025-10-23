# Use Nginx to serve static files
FROM nginx:alpine

# Copy app files to Nginx folder
COPY app/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
