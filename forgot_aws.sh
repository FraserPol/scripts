#!/bin/bash
MFA_ID=`aws iam list-mfa-devices --user-name $1 | jq '.MFADevices | .[]? | .SerialNumber'| sed -e 's/^"//' -e 's/"$//'`
aws iam deactivate-mfa-device --user-name $1 --serial-number $MFA_ID
aws iam update-login-profile --user-name $1 --password 'changeM3!' --password-reset-required
