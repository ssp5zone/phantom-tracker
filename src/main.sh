# Run the tests
cd phantom
./phantomjs test-runner.js
cd ..

# For each test output send a mail
for file in out/*/output.txt; do
    # get the name of current test case
    set `dirname $file`
    name=`basename $1`
    # check if test run resulted in ERROR
    if [ `grep ERROR $file | wc -w` == 0 ]
    then
      echo 'Sending Error mail'
      ./mailer/send_error_mail.sh $name
    else
      echo 'Sending Success mail'
      ./mailer/send_success_mail.sh $name
    fi
done
