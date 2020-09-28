#!/bin/bash
all_temp_unfulfillable () {
    echo "All Temporary unfulfillable orders and their audit report "
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript station_recovery get_temporary_unfulfillable_orders "['all']."
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Get all temporary unfulfillable order report</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

all_temp_unfulfillable
     
echo '</body>'
echo '</html>'

exit 0
