program p2431;
const
	maxn = 10000;
	maxkey = 100;
type
	node = record
		x,key:longint;
	end;
var
	l,p,n,i,ans,k:longint;
	a:array[1..maxn] of node;
	flag:array[0..maxkey] of longint;

procedure sort(l,r:longint);
 var
	i,j,x:longint;
	y:node;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1].x;
	repeat
		while (a[i].x < x) do inc(i);
		while (a[j].x > x) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

begin
	readln(n);
	for i:=1 to n do readln(a[i].x,a[i].key);
	readln(l,p);
	sort(1,n);
	ans:=0;
	repeat
		l:=l - p; p:=0;
		while (n > 1) and (a[n].x >= l) do begin
			inc(flag[a[n].key]);
			dec(n);
		end;
		if (l <= 0) then break;
		k:=maxkey;
		while (flag[k] = 0) do begin
			dec(k);
			if (k = 0) then begin
				writeln(-1);
				halt;
			end;
		end;
		p:=p + k;
		dec(flag[k]);
		inc(ans);
	until false;
	writeln(ans);
end.