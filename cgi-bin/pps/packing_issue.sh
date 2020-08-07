#!/bin/bash
packing_issue () {
    echo "PPS_ID : $1 BIN_ID : $2 "
    echo "Extracting Order id from PPS id and PPS bin"
    order_id=`sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript ppsbinrec get_column_by_id "[{$1, \""$2"\"},'sr_ids']." | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
    echo "Order id associated with this Bin is:-"
    echo "Status for this bin is:-"
    echo '<pre>'
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript ppsbinrec get_column_by_id "[{$1, \""$2"\"},'status']." 
    echo '</pre>'
    echo "Extracting Execution id from order Id:- $order_id"
    execution_id=`sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node get_column_by_id "[<<\"$order_id\">>,'execution_id']." | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
    echo "Execution found for above Order id :- $execution_id"
    echo "Calling Resume API via Swagger"
    curl -X POST "http://10.23.17.37:8080/api-gateway/process-service/wms-process/execution/$execution_id/resume" -H  "accept: */*"
    echo "Done"
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Fixing packing app issue</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

  echo "<form method=GET action=\"${SCRIPT}\">"\
       '<table nowrap>'\
          '<tr><td>PPS_ID</TD><TD><input type="number" name="PPS_ID" size=12></td></tr>'\
		  '<tr><td>BIN_ID</TD><TD><input type="number" name="BIN_ID" size=12></td></tr>'\
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
     XX=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
	  YY=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){2}.*/\2/'`
		
     echo "PPS_ID: " $XX
     echo '<br>'
	   echo "BIN_ID: " $YY
     echo '<br>'
	   packing_issue $XX $YY  
	
  fi
echo '</body>'
echo '</html>'

exit 0
