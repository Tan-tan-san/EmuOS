FROM alpine/git AS clone
WORKDIR /src
RUN git clone --depth 1 https://github.com/Emupedia/emupedia.github.io.git

FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# ✅ THIS is what actually works:
COPY --from=clone /src/emupedia.github.io/beta/emuos/. .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
