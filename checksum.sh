#!/bin/bash

LFS=/mnt/sda1/home/h3lix/workspace/mnt
RBUILDS=/mnt/sda1/home/h3lix/workspace/rbuilds

stamp=`cat ${RBUILDS}/md5.stamp`
orig_files=(`awk '{print $1}' ${RBUILDS}/md5sums`)
orig_md5=(`awk '{print $2}' ${RBUILDS}/md5sums`)

current_files=(`find $LFS -path $LFS/tmp -prune -o -path $LFS/proc -prune -o -path $LFS/sys -prune -o -path $LFS/usr/src -prune -o -path $LFS/tools -prune -o -type f -print`)

function find_orig_file {
    match=-1

    for ((i=0; i < ${#orig_files[@]}; i++))
    do
	if [ "${orig_files[$i]}" == "$1" ]; then
	    match=$i
	    
	    break;
	fi
    done
    
    echo "$match"
}

function get_md5 {
    current_md5=`md5sum "$1" | awk '{print $1}' `

    echo "$current_md5"
}

function compare_md5 {
    retval=1

    if [ "$1" != "$2" ]; then
	retval=0
    fi

    echo "$retval"
}

stamp_copied=0

for f in ${current_files[@]};
do
    nth_orig_file=$(find_orig_file "$f")

    current_md5=$(get_md5 "$f")

    if [ "$nth_orig_file" != -1 ]; then
	if [ "${current_md5}" != "${orig_md5[$nth_orig_file]}" ]; then
	    echo "file changed <$f>"

	    if [ "$stamp_copied" == 0 ]; then
		stamp_copied=1
		
		cp ${RBUILDS}/md5sums ${RBUILDS}/stamp-md5/md5sums.$(printf "%04d" "${stamp}")

		echo "$f" > ${RBUILDS}/stamp-md5/changes.$(printf "%04d" "${stamp}")
	    else
		echo "$f" >> ${RBUILDS}/stamp-md5/changes.$(printf "%04d" "${stamp}")
	    fi
	fi
    else
	md5sum "$f" >> ${RBUILDS}/md5sums
    fi
done

if [ "$stamp_copied" == 1 ]; then
    ((stamp = stamp + 1))

    md5sum "${current_files[@]}" > ${RBUILDS}/md5sums
    echo "$stamp" > ${RBUILDS}/md5.stamp
fi
