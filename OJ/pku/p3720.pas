program p3720;
var
	i,n,k,tot,a:longint;
	flag:array[0..100] of boolean;
	count:array[2..100,0..9] of longint;
begin
	fillchar(count,sizeof(count),0);
	for i:=2 to 100 do begin
		fillchar(flag,sizeof(flag),false);
		a:=1;
		while (not flag[a]) and (a <> 0) do begin
			flag[a]:=true;
			a:=a * 10;
			inc(count[i,a div i]);
			a:=a mod i;
		end;
	end;
	while not eof do begin
		readln(n,k);
		tot:=0;
		for i:=2 to n do tot:=tot + count[i,k];
		writeln(tot);
	end;
end.