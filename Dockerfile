FROM alpine/git AS clone
WORKDIR /src
RUN git clone --depth 1 https://github.com/Emupedia/emupedia.github.io.git

FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Copy only the whole beta folder from the clone step
COPY --from=clone /src/emupedia.github.io/beta/ .

# Use your custom nginx.conf to point root to /emuos inside beta
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
