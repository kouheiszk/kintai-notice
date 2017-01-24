#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
ROOT_DIR=$(cd $SCRIPT_DIR/../; pwd)

cp $ROOT_DIR/com.gmail.kouheiszk.kintaiNotifier.plist ~/Library/LaunchAgents/.
launchctl load ~/Library/LaunchAgents/com.gmail.kouheiszk.kintaiNotifier.plist
