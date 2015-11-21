{
	for(i=1; i<NF; i++){
		if (match($i, /[:alhpa:]\./) && match($(i+1), /[:upper:][:alpha:]+/)){
			tmp = $i;
			$i = $(i+1);
			$(i+1) = tmp;
		}
	}
	print
}
