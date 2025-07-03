FROM alpine/git AS clone
WORKDIR /src
RUN git clone --depth 1 https://github.com/Emupedia/emupedia.github.io.git

# ✅ NEW: test what’s really in there
RUN ls -al /src/emupedia.github.io/beta/emuos

FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# ✅ If the above path exists, this works.
COPY --from=clone /src/emupedia.github.io/beta/emuos/. .

RUN ls -al /usr/share/nginx/html
