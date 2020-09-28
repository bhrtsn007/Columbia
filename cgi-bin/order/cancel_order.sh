#!/bin/bash
cancel_some_order () {
    order_id=`sshpass -p '2sMcZ3pdTcp5v' ssh -o StrictHostKeyChecking=no -t gor@10.23.17.38 "/home/gor/easy_console/test.sh $1 " | head -3 | tail -1 | grep -o '[[:digit:]]*'`
    echo "<br>"
    echo $order_id
    echo "<br>"
    order_check=`sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node get_by_id "[<<\"$order_id\">>]." | head -3 | grep -E 'temporary_unfulfillable|pending|complete'`
    execution_id=`sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node get_column_by_id "[<<\"$order_id\">>,'execution_id']." | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
    echo "<br>"
    echo $execution_id
    echo "<br>"
    if [ ! -n "$order_check" ]
    then
        echo "Order is not in pending, temporary_unfulfillable or complete"
	echo "<br>"
        echo "Cancelling order from Core server"
        echo '<pre>'
        sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node update_columns_by_id "[<<\"$order_id\">>,[{'status','cancelled'}]]."
        echo '</pre>'
        echo "Cancelling Order from platform by Sending notification by station_recovery command"
        echo '<pre>'
        sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript station_recovery send_notification "[{'order_notification',<<\"$order_id\">>}]."
        #sshpass -p '2sMcZ3pdTcp5v' ssh -o StrictHostKeyChecking=no -t gor@10.23.17.38 "/home/gor/easy_console/update_SR_to_cancel.sh $1 " 
        echo '</pre>'
        echo "New Order status from platform"
        echo '<pre>'
        sshpass -p '2sMcZ3pdTcp5v' ssh -o StrictHostKeyChecking=no -t gor@10.23.17.38 "/home/gor/easy_console/updated_status.sh $1 "
        echo '</pre>'
        echo "New Status on Core"
        echo '<pre>'
        sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node get_by_id "[<<\"$order_id\">>]."
        echo '</pre>'
    else
        echo "Order is in  pending or temporary_unfulfillable so we cannot cancel it, Please contact GOR for support"
    fi
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>cancelling unfulfillable order</title>'
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
          '<tr><td>External_Service_Request_ID</TD><TD><input type="number" name="External_Service_Request_ID" size=12></td></tr>'\
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
	
     echo "External_Service_Request_ID: " $XX
     echo '<br>'
     cancel_some_order $XX 
  fi
echo '</body>'
echo '</html>'

exit 0
