#!/bin/bash

#mail subject
subject="System health check"

#mail recipients
mailTo="one@domain.com, two@domain.com"

#report file
report=/tmp/report.log

echo "This is system health report" > $report

#append systems disk space info to report file
df -h >> $report

#append free space info to report file
free -m >> $report

#append tomcat server info to report file
service tomcat6 status >> $report

#append mysql server status to report file
service mysqld status >> $report

mail -s "$subject" "$mailTo" < $report
