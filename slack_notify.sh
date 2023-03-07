#!/bin/bash

# Variables for Slack Notifications
SLACK_WEBHOOK_URL="https://hooks.slack.com/XXXXXXXX"
SLACK_USERNAME="A User" # Defaults to incoming-webhook if left blank
SLACK_CHANNEL=$4 # Slack Channel ie testing-macops
SLACK_ICONEMOJI=$5 # Emoji - Defaults to Eyes if NOT set
SLACK_ICON_URL=$6 # Icon URL - Defaults to Emoji if NOT set
SLACK_TITLE_TEXT=$7 # Title Text - Can be blank
SLACK_PRETEXT_TEXT="" #Optional text that appears above the attachment block
SLACK_COLOUR=$8 # Colour - "good", "warning", "danger" or hex_code
SLACK_AUTHOR_NAME=$9
if [[ $SLACK_AUTHOR_NAME == *"USE_SERIAL_NUMBER"* ]]; then
    SLACK_AUTHOR_NAME=(`ioreg -l | grep IOPlatformSerialNumber | awk '{print $4}' | cut -d \" -f 2`) # If set to USE_SERIAL_NUMBER will get serial number
fi

SLACK_AUTHOR_ICON_URL="" # https://raw.githubusercontent.com/wdas/reposado/master/other/reposado.jpg
SLACK_ATTACHMENT_TEXT=${10} # Optional text that appears within the attachment

curl -X POST -H 'Content-type: application/json' --data '{
    "icon_emoji":"'"$SLACK_ICONEMOJI"'",
    "icon_url":"'"$SLACK_ICON_URL"'",
    "username":"'"$SLACK_USERNAME"'",
    "channel":"'"$SLACK_CHANNEL"'",
    "text":"'"$SLACK_TITLE_TEXT"'",
    "attachments": [
        {
            "fallback": "Required plain-text summary of the attachment.",
            "color": "'"$SLACK_COLOUR"'",
            "pretext": "'"$SLACK_PRETEXT_TEXT"'",
            "author_name": "'"$SLACK_AUTHOR_NAME"'",
            "author_icon": "'"$SLACK_AUTHOR_ICON_URL"'",
            "text": "'"$SLACK_ATTACHMENT_TEXT"'",

        }
    ]
}' $SLACK_WEBHOOK_URL
