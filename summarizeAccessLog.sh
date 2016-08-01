if [ $# -eq 1 ] 
	then
   		awk '{
    		sub(/\?.*/,"",$4);
    		requests[$4] += $8; 
    		count[$4]++; 
    		if ($8 > max[$4]) {
        		max[$4] = $8
   			}
		} 
		END {
    		for (request in requests) {
       			print count[request]" "request" -> reqCount="count[request]," avgTime="requests[request] / count[request], " maxReqTime="max[request] 
   		   }
	}' $1 | sort -rn| cut -d " " -f 2-
else
    echo "ERROR: Invalid argument. Usuage: ./summarizeAccessLog.sh fileName"
fi
