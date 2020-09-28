#!/bin/bash

echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">'
echo '<title>PPS Related Command</title>'
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

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/active_pps.sh" class="active"><b>Get All Active/Online PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/all_empty_bin.sh" class="active"><b>All Empty Bin in System</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/all_pps_bin.sh" class="active"><b>All PPS Bin on PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/all_ppsbinrec.sh" class="active"><b>All PPSbinrec on PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/ppsbinrec_id.sh" class="active"><b>Specific PPSbinrec</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/ppsinfo_id.sh" class="active"><b>PPS Info by ID</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/restart_pps.sh" class="active"><b>Restart PPS Organise</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/specific_pps_bin.sh" class="active"><b>Specific PPS Bin</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/reset_ppsbin.sh" class="active"><b>Reset Any PPS Bin</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/reset_all_ppsbin.sh" class="active"><b>Reset All PPS Bin On PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/reset_seat.sh" class="active"><b>Reset PPS seat</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/order_notification.sh" class="active"><b>Send order complete notification</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/release_notification.sh" class="active"><b>Send release notification</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/packing_box_noti.sh" class="active"><b>Send packing box association notification</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/put_complete_noti.sh" class="active"><b>Send put complete notification</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/pps_crash.sh" class="active"><b>PPS Crash report for any PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/pps_sanity.sh" class="active"><b>Check PPS Sanity for any PPS</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/sideline_all_order.sh" class="active"><b>Sideline all Orders from that PPS</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/dock_station_info.sh" class="active"><b>Dock Station Info</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/dock_station_reset_soft.sh" class="active"><b>Soft reset dockstation</b></a>'
echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/dock_station_reset_hard.sh" class="active"><b>Hard reset dockstation</b></a>'

echo '<div class="vertical-menu"></div><a href="/cgi-bin/pps/station_help.sh" class="active"><b>Station recovery Help</b></a>'

echo '</body>'
echo '</html>'

exit 0
