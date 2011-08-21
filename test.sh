test=`which sfe`
if [ $? -ne 1 ]; then
	echo ok
elif [ $? -ne 0 ]; then
	echo no
fi
