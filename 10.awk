{ 
	for (i=1; i<=NF; i++)
	{
		if ($i == 0) continue;
		
		printf("%d", $i);
		if (i < NF) {
			printf("x");
			if (i < NF-1){
				printf("^%d", NF-i);
			}
			printf("+");
		}
	}
	printf("\n");
}
