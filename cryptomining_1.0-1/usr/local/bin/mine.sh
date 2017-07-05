#!/bin/bash -x

export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

ohgodatool -i 0 --mem-state 1 --mem-clock $GPU0_MCLOCK 
ohgodatool -i 0 --core-state 7 --core-clock $GPU0_CCLOCK 

ohgodatool -i 1 --mem-state 1 --mem-clock $GPU1_MCLOCK 
ohgodatool -i 1 --core-state 7 --core-clock $GPU1_CCLOCK 

ohgodatool -i 2 --mem-state 1 --mem-clock $GPU2_MCLOCK 
ohgodatool -i 2 --core-state 7 --core-clock $GPU2_CCLOCK 

ohgodatool -i 3 --mem-state 1 --mem-clock $GPU3_MCLOCK 
ohgodatool -i 3 --core-state 7 --core-clock $GPU3_CCLOCK 

ohgodatool -i 4 --mem-state 1 --mem-clock $GPU4_MCLOCK 
ohgodatool -i 4 --core-state 7 --core-clock $GPU4_CCLOCK 

ohgodatool -i 5 --mem-state 1 --mem-clock $GPU5_MCLOCK 
ohgodatool -i 5 --core-state 7 --core-clock $GPU5_CCLOCK 

cd /usr/local/bin/claymore

./ethdcrminer64 -epool stratum+tcp://eu2.ethermine.org:4444 -ewal $ETH_ADDRESS -epsw x \
		-mport $CLAYMORE_MPORT -eres $CLAYMORE_ERES -etha $CLAYMORE_ETHA -gser $CLAYMORE_GSER \
		-r $CLAYMORE_REBOOT_SCRIPT -asm $CLAYMORE_ASM \
		-tt -$GPU0_FANSPEED,-$GPU1_FANSPEED,-$GPU2_FANSPEED,-$GPU3_FANSPEED,-$GPU4_FANSPEED,-$GPU5_FANSPEED \
		-ttli $GPU0_MAXTEMP,$GPU1_MAXTEMP,$GPU2_MAXTEMP,$GPU3_MAXTEMP,$GPU4_MAXTEMP,$GPU5_MAXTEMP \
		-dcri $GPU0_DCRI,$GPU1_DCRI,$GPU2_DCRI,$GPU3_DCRI,$GPU4_DCRI,$GPU5_DCRI
                #-cclock $GPU0_CCLOCK,$GPU1_CCLOCK,$GPU2_CCLOCK,$GPU3_CCLOCK,$GPU4_CCLOCK,$GPU5_CCLOCK \
                #-mclock $GPU0_MCLOCK,$GPU1_MCLOCK,$GPU2_MCLOCK,$GPU3_MCLOCK,$GPU4_MCLOCK,$GPU5_MCLOCK \
		 #-dpool stratum+tcp://sia-eu1.nanopool.org:7777 -dwal $SIA_ADDRESS -dcoin sia
