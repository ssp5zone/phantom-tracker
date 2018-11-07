(
 	 echo "To: saurabh.singh.parihar@cummins.com,uday.g.kumar@cummins.com,manjunatha.ap@cummins.com,aishwarya.sivaraman@cummins.com,sundharam.pitchumani@cummins.com"
        echo "MIME-Version: 1.0"
        echo "Subject: Pricing PROD application maybe down"
        echo "Content-Type: multipart/mixed; boundary=\"FILEBOUNDARY\""
        echo
        echo "--FILEBOUNDARY"
        echo "Content-Type: multipart/alternative; boundary=\"MSGBOUNDARY\""
        echo

        echo "--MSGBOUNDARY"
        echo "Content-Type: text/html; charset=iso-8859-1"
        echo "Content-Disposition: inline"
        echo "<html><body>"
        echo "<font face=verdana size=2><b>The page did not load in 5 mins. There could be as issue. Please Check. </b></font>"
        echo "<br><br><br>"
        echo "<p><b>Note: This is an automation, please do not reply.</b></p>"
        echo "</body></html>"
        echo "--MSGBOUNDARY--"

        echo "--FILEBOUNDARY--"
) | /usr/lib/sendmail -t