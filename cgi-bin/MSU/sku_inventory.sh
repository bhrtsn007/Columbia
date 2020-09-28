#!/bin/bash
sku_information () {
    product_uid=`sshpass -p '2sMcZ3pdTcp5v' ssh -o StrictHostKeyChecking=no -t gor@10.23.17.38 "/home/gor/easy_console/get_item_uid.sh $1" | head -3 | tail -1 | grep -o '[[:digit:]]*'`
    echo "<br>"
    echo "Internal Id for SKU is:" $product_uid
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript inventory search_by "[[{'item_uid', 'equal', <<\"$product_uid\">>}], 'record']."
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Get Inventory Detail from SKU_ID</title>'
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
          '<tr><td>SKU_ID</TD><TD><input type="text" name="SKU_ID" size=12></td></tr>'\
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
    XX=`echo "$QUERY_STRING" | sed -n 's/^.*SKU_ID=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
	
     echo "SKU_ID: " $XX
     echo '<br>'
     sku_information $XX 
  fi
echo '</body>'
echo '</html>'

exit 0
