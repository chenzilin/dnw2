#
# Regular cron jobs for the dnw2 package
#
0 4	* * *	root	[ -x /usr/bin/dnw2_maintenance ] && /usr/bin/dnw2_maintenance
