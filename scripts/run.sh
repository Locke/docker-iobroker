#!/bin/sh

./iobroker host $(cat .install_host) && echo $(hostname) > .install_host

node node_modules/iobroker.js-controller/controller.js
