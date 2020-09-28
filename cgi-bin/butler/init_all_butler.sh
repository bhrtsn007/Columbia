#!/bin/bash
butler_debug_off_all () {
    echo "Sending  Init for all Butler "
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/bin/butler_server rpcterms butler_functions send_debug_off_all_butlers 
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Sending Init to all Butler</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

butler_debug_off_all
     
echo '</body>'
echo '</html>'

exit 0
