#!/usr/bin/env sh

wp-cli core install --allow-root \
--title="LetterCrunch" \
--admin_name=PLACEHOLDER_USERNAME \
--admin_password=PLACEHOLDER_PASS \
--admin_email=email@emailservice.org \
--url="https://localhost/" \
--path="/var/www"

wp-cli user create REGUSERNAME email@emailservice.com --user_pass=REGPASSWORD --role=subscriber
