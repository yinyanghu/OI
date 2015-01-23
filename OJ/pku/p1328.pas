program p1328;
const
	maxn = 1005;
type
	node = record
		left,right:double;
		x,y:longint;
	end;
var
	n,test,d:longint;
	a:array[1..maxn] of node;
	flag:boolean;

function check(a,b:node):boolean;
 var
	k:double;
 begin
	k:=a.left - b.left;
	if (k > 0.0) then exit(true);
	if (k < 0.0) then exit(false);
	k:=b.right - a.right;
	if (k > 0.0) then exit(true) else exit(false);
 end;

procedure sort(l,r:longint);
 var
	i,j:longint;
	x,y:node;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (check(x,a[i])) do inc(i);
		while (check(a[j],x)) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

procedure init;
 var
	i:longint;
	delta:double;
 begin
	inc(test);
	flag:=true;
	readln(n,d);
	if (n = 0) and (d = 0) then halt;
	for i:=1 to n do begin
		readln(a[i].x,a[i].y);
		if (d < a[i].y) then flag:=false;
	end;
	if not flag then exit;
	for i:=1 to n do begin
		delta:=double(sqrt(d * d - a[i].y * a[i].y));
		a[i].left:=double(a[i].x) - delta; a[i].right:=double(a[i].x) + delta;
	end;
 end;

procedure main;
 var
	i,tot:longint;
	x:double;
 begin
	sort(1,n);
	tot:=1; x:=a[1].right;
	for i:=2 to n do begin
		if (a[i].left > x) then begin
			inc(tot);
			x:=a[i].right;
		end else if (a[i].right < x) then x:=a[i].right;
	end;
	writeln('Case ',test,': ',tot);
 end;

begin
	test:=0;
	while true do begin
		init;
		if flag then main else writeln('Case ',test,': ',-1);
	end;
end.
