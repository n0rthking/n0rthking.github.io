#!/bin/bash

create_point()
{
	MCC=`echo "$1" | cut -d ';' -f 2`
	MNC=`echo "$1" | cut -d ';' -f 3`
	CI=`echo "$1" | cut -d ';' -f 4`
	TAC=`echo "$1" | cut -d ';' -f 5`
	ENB=`echo "$1" | cut -d ';' -f 6`
	PCI=`echo "$1" | cut -d ';' -f 7`
	LAT=`echo "$1" | cut -d ';' -f 8`
	LON=`echo "$1" | cut -d ';' -f 9`
	LOCATION=`echo "$1" | cut -d ';' -f 10`
	EARFCN=`echo "$1" | cut -d ';' -f 11`

echo "    {"
echo "      \"type\": \"Feature\","
echo "      \"properties\": {"
echo "        \"MCC\": \"${MCC}\","
echo "        \"MNC\": \"${MNC}\","
echo "        \"CI\": \"${CI}\","
echo "        \"TAC\": \"${TAC}\","
echo "        \"eNb\": \"${ENB}\","
echo "        \"PCI\": \"${PCI}\","
echo "        \"Lat\": \"${LAT}\","
echo "        \"Lon\": \"${LON}\","
echo "        \"Location\": \"${LOCATION}\","
echo "        \"EARFCN\": \"${EARFCN}\""
echo "      },"
echo "      \"geometry\": {"
echo "        \"type\": \"Point\","
echo "        \"coordinates\": ["
echo "          ${LON},"
echo "          ${LAT}"
echo "        ]"
echo "      }"
echo "    },"

}

print_header()
{
	echo '{'
	echo '  "type": "FeatureCollection",'
	echo '  "features": ['
}

print_footer()
{
	echo '  ]'
	echo '}'
}


print_header
while read -r RIADOK; do
	create_point "$RIADOK"
done < "$1"
print_footer
