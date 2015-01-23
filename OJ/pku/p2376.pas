program p2376;
const
	maxn = 25000;
type
	node = record
		s,t:longint;
	end;
var
	a:array[1..maxn] of node;
	i,n,l,total,size,p,max,x:longint;
procedure sort(l,r:longint);
 var
	i,j:longint;
	x,y:node;
 begin
 	i:=l; j:=r; x:=a[(l + r) shr 1];
 	repeat
 		while (a[i].s < x.s) or ((a[i].s = x.s) and (a[i].t > x.t)) do inc(i);
 		while (a[j].s > x.s) or ((a[j].s = x.s) and (a[j].t < x.t)) do dec(j);
 		if i <= j then begin
 			y:=a[i]; a[i]:=a[j]; a[j]:=y;
 			inc(i); dec(j);
 		end;
 	until i > j;
 	if l < j then sort(l,j);
 	if i < r then sort(i,r);
 end;

begin
	readln(n,l);
	for i:=1 to n do readln(a[i].s,a[i].t);
	sort(1,n);
	if a[1].s > 1 then begin
		writeln(-1);
		halt;
	end;
	total:=1;
	p:=1; size:=a[1].t;
	while (size < l) do begin
		max:=size; x:=-1;
		while (p < n) do begin
			inc(p);
			if a[p].s > size + 1 then break;
			if (a[p].t > max) then begin
				max:=a[p].t; x:=p;
			end;
		end;
		if (x = -1) then break;
		p:=x; size:=max; inc(total);
	end;
	if size >= l then writeln(total) else writeln(-1);
end.
