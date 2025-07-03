FROM nginx:alpine

# Copy the whole beta directory into /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
COPY Emupedia/beta/ .

# Tell nginx to look inside /usr/share/nginx/html/emuos as its root
# We'll override nginx config:
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
