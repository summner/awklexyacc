BEGIN   { cnt = 0 }
!/^;.*/  { cnt = cnt + NF }
END     { print cnt }
