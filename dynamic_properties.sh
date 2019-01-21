#!/bin/sh

error_msg="wrong parameters, must be like this '$0 get key' or '$0 set key value'"

# check params
if ([ $1 != "get" ] && [ $1 != "set" ]) || [ -z "$2" ] || ([ $1 = "set" ] && [ -z "$3" ]);
then
    echo "$error_msg"
    exit 1
fi

# logic
operation=$1
key=$2
value=$3

case ${operation} in
    "get" ) # get operation
        if [ -f ${key} ]; then
           cat ${key}
        else
           echo ""
        fi
    ;;
    "set" ) # set operation
        echo ${value} > ${key}
        echo "ok"
    ;;
esac
