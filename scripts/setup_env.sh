# remove old conf
rm -f poxa.conf

# check for port
[ -z "$PORT" ] && echo "PORT not set, starting normally" && exit 1;
if ! [ $PORT -eq $PORT ] 2>/dev/null ; then
   echo "PORT is not a number" >&2; exit 1;
fi

# check if all required variables are set
[ -z "$POXA_APP_ID" ] && echo "POXA_APP_ID not set" && exit 1;
[ -z "$POXA_APP_KEY" ] && echo "POXA_APP_KEY not set" && exit 1;
[ -z "$POXA_SECRET" ] && echo "POXA_SECRET not set" && exit 1;

# write required variables to config
echo 'poxa.port = '$PORT>>poxa.conf
echo 'poxa.app_key = "'$POXA_APP_KEY'"'>>poxa.conf
echo 'poxa.app_secret = "'$POXA_SECRET'"'>>poxa.conf
echo 'poxa.app_id = "'$POXA_APP_ID'"'>>poxa.conf

# write optional variables to config, if any
[ -n "$POXA_WEB_HOOK" ] && echo 'poxa.web_hook = "'$POXA_WEB_HOOK'"'>>poxa.conf

# copy config
mkdir -p /app/running-config
cp poxa.conf /app/running-config/
echo "wrote config from env: $(cat /app/running-config/poxa.conf)"
