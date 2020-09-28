#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
echo '<title>Order/SKU information</title>'
echo '<style>'

echo '.vertical-menu a {'\
  'background-color: #FF9933;'\
  'border: 1px orange; '\
  'color: white; '\
  'padding: 10px 24px;'\
  'cursor: pointer;'\
  'width: 100%;'\
  'text-align: center;'\
  'overflow:hidden;'\
  'position:relative;'\
  'float:left;'\
  'display: block;'\
  '}'
echo  'a:hover, a:active {'\
      '  background-color: grey;'\
      '}'

echo '</style>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<div class="vertical-menu"><img src="https://scmtech.in/assets/images/grey.png" style="position:relative; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'

echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

echo '<div class="vertical-menu"></div><a href="/cgi-bin/MSU/sku_inventory.sh" class="active"><b>Get Inventory information from SKU ID</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/order/internal_order_id.sh" class="active"><b>Get Internal Order ID</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/order/order_from_core_platform.sh" class="active"><b>Get Order Status from Core and Platform</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/order/all_temp_unfullilable_order.sh" class="active"><b>All Temp_unfullilable Order</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/order/temp_unfulfillable_order.sh" class="active"><b>Temporary unfulfillable order detail</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/order/specific_order.sh" class="active"><b>Order Details(External Id from Internal ID)</b></a>'

echo '</body>'
echo '</html>'

exit 0

