#!/bin/bash
reset_seat () {
    echo "Clearing pps seat for: " $1
    echo '<pre>'
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript station_recovery reset_seat "[$1]."
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Reset Seat</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "Type Seat name ex:- front_5 for clearing pps 5 front seat"
echo "<br>"
  echo "<form method=GET action=\"${SCRIPT}\">"\
       '<table nowrap>'\
          '<tr><td>pps_seat_name</TD><TD><input type="text" name="pps_seat_name" size=12></td></tr>'\
           '</tr></table>'

  echo '<br><input type="submit" value="SUBMIT">'\
       '<input type="reset" value="Reset"></form>'

  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.
  echo "$QUERY_STRING<br>"
  echo "<br>"
  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
     # No looping this time, just extract the data you are looking for with sed:

     XX=`echo "$QUERY_STRING" | sed -n 's/^.*pps_seat_name=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
     
  
     echo "PPS Seat: " $XX
     echo '<br>'
     reset_seat $XX 
  fi
echo '</body>'
echo '</html>'

exit 0
