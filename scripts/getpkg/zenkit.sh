#!/bin/bash
set -e
aria2c https://static.zenkit.com/downloads/desktop-apps/base/zenkit-base-linux.deb
aria2c https://static.zenkit.com/downloads/desktop-apps/chat/zenchat-linux.deb
aria2c https://static.zenkit.com/downloads/desktop-apps/todo/zenkit-todo-linux.deb
aria2c https://static.zenkit.com/downloads/desktop-apps/hypernotes/hypernotes-linux.deb