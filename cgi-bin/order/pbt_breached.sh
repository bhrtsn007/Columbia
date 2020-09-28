#!/bin/bash
breach_order () {
    echo "No. of PBT breached orders"
    echo "<br>"
    echo '<pre>'   
    sudo /opt/butler_server/bin/butler_server rpcterms pps_orderlines print_pbt_summary_without_pending_inventory
    echo '</pre>'
    echo "<br>"
    echo "DONE"
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>PBT breach order</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
breach_order
echo '</body>'
echo '</html>'

exit 0