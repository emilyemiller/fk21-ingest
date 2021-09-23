#!/bin/bash
#######################################################

usage () {
  echo -e "\n Usage ./$(basename $0) id \n"\
	  "[ id ]     => cruise_id \n"\
  exit 1
}

main () {
	#SealogLaunch
	echo "listing Submersible Sealog/SealogLaunch json files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/S0*_loweringRecord.json
	echo "done SealogLaunch, beginning copy to /scratch/mgds"

	#Submersible Reports
	echo "listing Submersible Reports/pdf-reports files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/Reports/*pdf
	echo "done pdfs, beginning copy to /scratch/mgds"

	#Submersible Navigation (PilotChoiceGGA)
	echo "listing Submersible Navigation (PilotChoiceGGA)/subastian_nav files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/SCSData/SUBASTIAN/*PilotChoice-GGA-RAW*
	echo "done PilotChoiceGGA"

	#Submersible ASCII SCSData
	echo "listing Submersible ASCII SCSData/SCS files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/SCSData/SUBASTIAN/*
	echo "done SCS"

	#Submersible KMLs
	echo "listing Submersible KMLs/kml files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/*kml
	echo "done kmls"

	#Submersible Science Sensor
	echo "Submersible Science Sensor/SCIENCE_SENSOR files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/SCSData/SCIENCE_SENSOR/*
	echo "done science sensor"

	#Submersible ASCII Eventlogs
	echo "Submersible ASCII Eventlogs/eventlog files"
	gsutil ls gs://2021fkdata/${1}/Subastian/${1}_S0*/Sealog/S0*_sealogExport.csv
	echo "done eventlogs"

	#Submersible Photos
	echo "Submersible Photos/photos"
	echo "done photos"

	echo "DONE DONE"
}

if [ $# -eq 0 ]; then
  usage
fi

# Run the main loop
main ${1}

