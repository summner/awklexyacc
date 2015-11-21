END {
	getline < "14.in.opis"
	wys = $1
	szer = $2
	poprawny = 1
	patBase = "^x{"szer"}$"
	patIn = "^x {"szer-2"}x$"
	state = 1
	while(getline < "14.in"){
		if (state == 1){
			if ($0 !~ patBase || wys < 2){
				poprawny = 0
				break
			}
			wys -= 1
			state = 2
		} else if (state == 2){
			if (wys > 1) {
				if ($0 !~ patIn){
					poprawny = 0
					break
				} else {
					wys -= 1
				}
			} else {
				if ($0 !~ patBase || wys == 0){
					poprawny = 0
					break
				}
				wys -= 1; 
			}
		}
	}
	print poprawny
}
