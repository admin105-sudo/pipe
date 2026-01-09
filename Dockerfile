# Use the official nginx image
FROM nginx:latest

# Copy your static content
COPY index.html /usr/share/nginx/html/

# Copy your custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
