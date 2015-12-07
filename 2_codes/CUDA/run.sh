#	!/bin/bash
make sim
dateNow=`date +%Y-%m-%d--%H-%M`
./assembly_embedded_cuda > $dateNow--run.log
