#!/bin/bash
available_storage () {
    echo "All available storable location"
    echo "<br>"
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript storage_info search_by "[[{'status', 'equal', 'available'}], 'record']."
    echo "<br>"
    echo "DONE"
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Remove Order</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
available_storage
echo '</body>'
echo '</html>'

exit 0