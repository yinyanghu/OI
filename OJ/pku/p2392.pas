program p2392;
const
	maxn = 400;
	maxm = 40000;
type
	node = record
		h,a,c:longint;
	end;
var
	w:array[1..maxn] of node;
	f:array[0..maxm] of boolean;
	i,j,ans,n,k:longint;
	
procedure sort(l,r:longint);
 var
 	i,j,x:longint;
 	y:node;
 begin
 	i:=l; j:=r; x:=w[(l + r) shr 1].a;
 	repeat
 		while (w[i].a < x) do inc(i);
 		while (w[j].a > x) do dec(j);
 		if (i <= j) then begin
 			y:=w[i]; w[i]:=w[j]; w[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n);
	for i:=1 to n do readln(w[i].h,w[i].a,w[i].c);
	sort(1,n);
	ans:=0;
	fillchar(f,sizeof(f),false);
	f[0]:=true;
	for i:=1 to n do
		for k:=0 to w[i].c - 1 do
			for j:=w[i].a - w[i].h downto k * w[i].h do
				if (f[j]) then begin
					f[j + w[i].h]:=true;
					if (j + w[i].h > ans) then ans:=j + w[i].h;
				end;
	writeln(ans);
end.