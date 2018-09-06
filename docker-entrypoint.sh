#!/bin/sh -x

# lighttpd docker startup script

# Identify application being started. 

CONFIG="/var/www/localhost/htdocs/index.html"
TEMPLATE="/var/www/localhost/htdocs/index.temp"

export NUMBER="${NUMBER}"
export TITLE="${TITLE}"


# Generate config from the template
#envsubst < "${TEMPLATE}" | awk '{s=$0;gsub("\.[^.]+=.*$","",s);if(s != last){last=s;print "["s"]"};print " "substr($0,length(s)+2)}' > "${CONFIG}"
envsubst < "${TEMPLATE}"  > "${CONFIG}"

echo "Docker Starts here"

#CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

lighttpd -D -f /etc/lighttpd/lighttpd.conf
