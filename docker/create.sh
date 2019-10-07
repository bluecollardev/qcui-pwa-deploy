#!/bin/bash

#if [ "$(id -u)" != "0" ]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

### Configure paths
WS_PATH="${DIR}/../app"

# Clone the app
git clone --depth 1 https://github.com/bluecollardev/qcui-pwa-demo.git ${WS_PATH}
# Zap .git, it's not needed for the output image(s)
rm -rf $(find ${WS_PATH} -name ".git" -or -name ".gitignore" -or -name ".gitattributes")

# Update file permissions
echo "Update permissions"
chown -R ${USER:=$(/usr/bin/id -run)} ${WS_PATH}

# Set cwd to original dir
cd ${WS_PATH}

# Build frontend
npm install &&
npm run build &&
rm -rf node_modules

# Set cwd to original dir
cd ${DIR}

docker-compose down
docker-compose up --build
