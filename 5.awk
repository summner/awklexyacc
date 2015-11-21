{
	for(i = 1; i<=NF; i++){
		if ($i ~ /([[:upper:]]\.)([[:upper:]][[:alpha:]]+$)/){
			split($i, x, ".");
			printf(x[2]" "x[1]"."); 
		} else {
			printf($i);		
		}
		if (i < NF) printf(" ");
	}
	printf("\n");
}
