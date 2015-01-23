program p3629;
const
	maxn = 100000;
var
	n,k,p,i,j,tot,player,left,right:longint;
	a:array[1..maxn] of longint;
	f:array[1..maxn * 11] of longint;
procedure sort(l,r:longint);
 var
	i,j,x,y:longint;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i] < x) do inc(i);
		while (a[j] > x) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

begin
	readln(n,k,p);
	for i:=1 to k do f[i]:=i;
	left:=1; right:=k; player:=1;
	tot:=0;
	for i:=1 to k do begin
		if (player = n) then begin
			inc(tot);
			a[tot]:=f[left];
		end;
		inc(player);
		if (player > n) then player:=player mod n;
		inc(left);
		for j:=1 to p do begin
			inc(right);
			f[right]:=f[left];
			inc(left);
		end;
	end;
	sort(1,tot);
	for i:=1 to tot do writeln(a[i]);
end.
