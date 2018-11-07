(
 	echo "To: yourname@gmail.com"
        echo "MIME-Version: 1.0"
        echo "Subject: Application [$name] is: DOWN"
        echo "Content-Type: multipart/mixed; boundary=\"FILEBOUNDARY\""
        echo
        echo "--FILEBOUNDARY"
        echo "Content-Type: multipart/alternative; boundary=\"MSGBOUNDARY\""
        echo

        echo "--MSGBOUNDARY"
        echo "Content-Type: text/html; charset=iso-8859-1"
        echo "Content-Disposition: inline"
        echo "<html><body>"
        echo "<p><b>Note: The application - [$name] seems to be down. Please Check.</b></p>"
        echo "<font face=verdana size=2><b>ERROR: </b></font><br>"
        echo "<img src=\"cid:errorpng\" style=\"max-width: 99.9%;\" /><br><br>"
        echo "<br><br>"
        echo "<p><b>Note: This is an automation, please do not reply.</b></p>"
        echo "</body></html>"
        echo "--MSGBOUNDARY--"

        echo
        echo "--FILEBOUNDARY"
        echo "Content-Type: image/jpeg"
        echo "Content-Disposition: inline; filename=\"error.png\""
        echo "Content-Transfer-Encoding: base64"
        echo "Content-Id: <errorpng>"
        echo
        base64 phantom/test-cases/$name/error.png
        echo

        echo "--FILEBOUNDARY--"
) | /usr/lib/sendmail -t