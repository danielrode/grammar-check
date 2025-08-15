
FROM alpine:latest

RUN <<EOF
set -e

apk add --no-cache \
    gcompat libgcc libgc++ openjdk21-jre \
;

wget https://github.com/caderek/gramma/releases/download/v1.6.0/gramma-linux64-v1.6.0.zip
unzip gramma-linux64-v1.6.0.zip
rm -fr gramma-linux64-v1.6.0.zip

./gramma server install
EOF

RUN <<EOF
touch /start.sh
chmod +x /start.sh
echo '#!/usr/bin/env sh' >> /start.sh
echo '/gramma server start' >> /start.sh
echo 'for i in "$@"; do /gramma check "$i"; done' >> /start.sh
EOF

ENTRYPOINT ["sh", "/start.sh"]
