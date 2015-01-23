program p2436;
const
	maxn = 1000;
var
	a:array[1..maxn] of longint;
	n,d,k,i,j,w,p,tot,ans:longint;
begin
	readln(n,d,k);
	fillchar(a,sizeof(a),0);
	for i:=1 to n do begin
		read(w);
		for j:=1 to w do begin
			read(p);
			a[i]:=a[i] or (1 shl (p - 1));
		end;
	end;
	ans:=0;
	for i:=(1 shl d) - 1 downto 1 do begin
		tot:=0;
		for j:=1 to d do
			if (i and (1 shl (j - 1)) > 0) then inc(tot);
		if (tot > k) then continue;
		tot:=0;
		for j:=1 to n do
			if (a[j] and i = a[j]) then inc(tot);
		if (tot > ans) then ans:=tot;
	end;
	writeln(ans);
end.