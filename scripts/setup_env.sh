[ -z "$POXA_APP_COUNT" ] && echo "Not using env variables. Starting normally" && exit 1;
if ! [ $POXA_APP_COUNT -eq $POXA_APP_COUNT ] 2>/dev/null ; then
   echo "POXA_APP_COUNT is not a number" >&2; exit 1;
fi
[ -z "$PORT" ] && echo "PORT not set" && exit 1;
if ! [ $PORT -eq $PORT ] 2>/dev/null ; then
   echo "PORT is not a number" >&2; exit 1;
fi
#check if all variables are set
if  [ "$POXA_APP_COUNT" -gt 1 ] ; then
  #MULTI APP
  for i in $(seq 1 $POXA_APP_COUNT) ;do
    eval key=\$POXA_APP_KEY_$i
    eval id=\$POXA_APP_ID_$i
    eval secret=\$POXA_SECRET_$i
    [ -z $key ] && echo "POXA_APP_KEY_$i not set" && exit 1;
    var=$(echo "POXA_APP_ID_$i")
    [ -z $id ] && echo "POXA_APP_ID_$i not set" && exit 1;
    var=$(echo "POX_SECRET_$i")
    [ -z $secret ] && echo "POXA_SECRET_$i not set" && exit 1;
  done
  #write info to config
  echo 'poxa.port = '$PORT>>poxa.conf
  echo -n 'poxa.apps = ['>>poxa.conf
  for i in $(seq 1 $POXA_APP_COUNT) ;do
    eval key=\$POXA_APP_KEY_$i
    eval id=\$POXA_APP_ID_$i
    eval secret=\$POXA_SECRET_$i
    echo -n '{'>>poxa.conf
    echo -n '"'$id'",'>>poxa.conf
    echo -n '"'$key'",'>>poxa.conf
    echo -n '"'$secret'"}'>>poxa.conf
    if [ "$i" -lt "$POXA_APP_COUNT" ]; then
      echo -n ','>>poxa.conf
    fi
   done
   echo ']'>>poxa.conf
else
  #SINGLE APP
  [ -z "$POXA_APP_ID" ] && echo "POXA_APP_ID not set" && exit 1;
  [ -z "$POXA_APP_KEY" ] && echo "POXA_APP_KEY not set" && exit 1;
  [ -z "$POXA_SECRET" ] && echo "POXA_SECRET not set" && exit 1;
  echo 'poxa.port = '$PORT>>poxa.conf
  echo 'poxa.app_key = "'$POXA_APP_KEY'"'>>poxa.conf
  echo 'poxa.app_secret = "'$POXA_SECRET'"'>>poxa.conf
  echo 'poxa.app_id = "'$POXA_APP_ID'"'>>poxa.conf
fi
mkdir /app/running-config
cp poxa.conf /app/running-config/
echo "finished writing config from env"