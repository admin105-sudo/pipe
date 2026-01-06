# Use nginx web server
FROM nginx:alpine

# Remove default nginx html files
RUN rm -rf /usr/share/nginx/html/*

# Copy our html file
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
