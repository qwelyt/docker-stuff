#!/bin/bash
n=0
until [ "$n" -ge 5 ]
do
    dbeaver 2>&1 | tee beaver.log
    bad=$(grep "BadAccess" beaver.log | wc -l)
    if [ "$bad" -gt 0 ]; then
        echo "Faild to actually start. Retry $n/5"
    else
        break
    fi
    rm beaver.log
    n=$((n+1))
    sleep 1
done
exit 1
