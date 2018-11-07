(
 	 echo "To: yourname@gmail.cpm"
        echo "MIME-Version: 1.0"
        echo "Subject: Application [$1] is: UP"
        echo "Content-Type: multipart/mixed; boundary=\"FILEBOUNDARY\""
        echo
        echo "--FILEBOUNDARY"
        echo "Content-Type: multipart/alternative; boundary=\"MSGBOUNDARY\""
        echo

        echo "--MSGBOUNDARY"
        echo "Content-Type: text/html; charset=iso-8859-1"
        echo "Content-Disposition: inline"
        echo "<html><body>"
        echo "<p>The application was tested with following outcome:</p>"
        for file in ../our/$1/*.png
                echo "<font face=verdana size=2><b>$file: </b></font><br>"
                echo "<img src=\"cid:$file\" style=\"max-width: 99.9%;\" /><br><br>"
        done
        echo "<br><br>"
        echo "<p><b>Note: This is an automation, please do not reply.</b></p>"
        echo "</body></html>"
        echo "--MSGBOUNDARY--"

        for file in ../our/$1/*.png
                echo
                echo "--FILEBOUNDARY"
                echo "Content-Type: image/jpeg"
                echo "Content-Disposition: inline; filename=\"$file\""
                echo "Content-Transfer-Encoding: base64"
                echo "Content-Id: <$file>"
                echo
                base64 phantom/$1/$file
                echo
        done

        echo "--FILEBOUNDARY--"
) | /usr/lib/sendmail -t