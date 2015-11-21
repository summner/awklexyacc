END {
	getline < "13.in.opis"
	wys = $1
	szer = $2
	poprawny = 1
	pat = "^x{"szer"}$"
	while(getline < "13.in"){
		if ($0 !~ pat || wys == 0){
			poprawny = 0
			break
		} else {
			wys -= 1
		}
	}
	print poprawny
}
