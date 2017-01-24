#!/bin/sh

if [ -f ~/Library/LaunchAgents/com.gmail.kouheiszk.kintaiNotifier.plist ]; then
    launchctl unload ~/Library/LaunchAgents/com.gmail.kouheiszk.kintaiNotifier.plist
    rm -f ~/Library/LaunchAgents/com.gmail.kouheiszk.kintaiNotifier.plist
fi
