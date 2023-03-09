# Slack Notification

## What does it do?

Add this script to a Jamf Policy to get slack notification.

## What do you need?

You'll need to create a webhook in Slack:
[https://slack.com/intl/en-gb/help/articles/115005265063-Incoming-webhooks-for-Slack](https://slack.com/intl/en-gb/help/articles/115005265063-Incoming-webhooks-for-Slack)

## Jamf Documentation: Scripts

[https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Scripts.html](https://learn.jamf.com/bundle/jamf-pro-documentation-current/page/Scripts.html)

## Extra info - Adding to Jamf Pro:

1. Upload the ****slack_notify.sh**** script to your JamfPro.
2. Change the `SLACK_WEBHOOK_URL` to your slack webhook
3. Change the `SLACK_USERNAME` to a username of your choice for example “Jamf Pro”
4. Optional - Add Parameter Labels
![alt text](https://github.com/notverypc/slack_notification/blob/main/Parameter_Labels.png)

## Extra info - Adding to a policy

1. Add the script to policy
2. Decide Priority - do you want notified at the start or end of the policy run?
3. Add the Parameter Values. (See Parameter_Values.png)
4. Parameter 9 can be either an authors name or the Mac’s serial number if “USE_SERIAL_NUMBER” is entered as the value.
![alt text](https://github.com/notverypc/slack_notification/blob/main/Parameter_Values.png)

## Examples

Automated Builds

![alt text](https://github.com/notverypc/slack_notification/blob/main/Automated_builds.png)

Logs Uploaded

![alt text](https://github.com/notverypc/slack_notification/blob/main/Logs_Uploaded.png)
