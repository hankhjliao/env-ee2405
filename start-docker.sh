#!/usr/bin/env sh

docker build -t ee2405 .
docker run -it -v $(realpath .):/code -v /tmp/.X11-unix:/tmp/.X11-unix\
           -e DISPLAY --name ee2405 ee2405

# For X11 support:
# 1. Add user:             "$ useradd -m -s /bin/bash -u UID USER"
# 2. Change to the user:   "$ su USER"
# 3. Install X11 support:  "$ apt install x11-apps"
# 4. Test X11:             "$ xclock"
#
# Note: UID USER should be same as the user in host.
#       You can use "$ id" to check UID
#       and use "$ whoami" to check USER.

