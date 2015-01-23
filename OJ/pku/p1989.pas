program p1989;
const
	maxk = 10000;
var
	flag:array[1..maxk] of boolean;
	ans,total,i,x,n,k:longint;
begin
	readln(n,k);
	total:=0; ans:=1;
	fillchar(flag,sizeof(flag),true);
	for i:=1 to n do begin
		readln(x);
		if (flag[x]) then begin
			inc(total);
			if (total = k) then begin
				inc(ans);
				total:=0;
				fillchar(flag,sizeof(flag),true);
			end else flag[x]:=false;
		end;
	end;
	writeln(ans);
end.