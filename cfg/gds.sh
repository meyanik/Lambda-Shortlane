#!/bin/bash
cd  ${OPENLANE_ROOT}/2022.12/designs/$filename/runs/
FILE=$(ls /foss/tools/openlane/2022.12/designs/$filename/runs/)
echo "${FILE}"
cd ${FILE}
cp ${OPENLANE_ROOT}/2022.12/designs/$filename/runs/$FILE/results/final/gds/$filename.gds $2/
klayout ${OPENLANE_ROOT}/2022.12/designs/$filename/runs/$FILE/results/final/gds/$filename.gds


