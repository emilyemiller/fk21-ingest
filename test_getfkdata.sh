#!/bin/bash
#######################################################

usage () {
  echo -e "\n Usage ./$(basename $0) id \n"\
          "[ id ]     => cruise_id \n"\
  exit 1
}

base="/scratch/mgds/work/Falkor/"
cd $base
echo "pwd: $base"

main () {
        #SealogLaunch
        echo "listing Submersible Sealog/SealogLaunch json files"
        gsutil ls "gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/S0*_loweringRecord.json"
        echo "done finding SealogLaunch files, looking for local directory to pull"
	array=$(gsutil ls "gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/S0*_loweringRecord.json" | grep -o "${1}/Subastian/${1}_S[0-9][0-9][0-9][0-9]/\w*")
	for val in $array;do
		echo "${base}${val}"
		if [[ -d "${base}${val}" ]] 
		then echo "path exists"
		else echo "path doesn't exist"; fi
	done
}

if [ $# -eq 0 ]; then
  usage
fi

# Run the main loop
main $1
