BEGIN { pos=1 }
/#replace [^ ]* [^ ]*/ { repl[$2] = $3; keys[pos] = $2; pos+=1; }
!/#replace [^ ]* [^ ]*/ { bs = $0; for(ki = 1; ki < pos; ki++) { 
	key = keys[ki] 
	s=bs
	bs=""
	ind = index(s, key);
	while (ind > 0){
		bs=bs substr(s, 0, ind-1)
		s = substr(s, ind+length(key), length(s))
		bs = bs repl[key]
		ind = index(s, key)
	}
	bs = bs s
}; print bs}
