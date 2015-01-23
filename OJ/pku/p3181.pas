program p3181;
const
	maxn = 1000;
	maxl = 100;
type
	bignumber = record
		len:longint;
		num:array[1..maxl] of longint;
	end;
var
	f:array[0..maxn] of bignumber;
	i,j,n,k:longint;

procedure add(a,b:bignumber; var c:bignumber);
 var
	i,k:longint;
 begin
	if (a.len > b.len) then c.len:=a.len else c.len:=b.len;
	k:=0;
	for i:=1 to c.len do begin
		c.num[i]:=a.num[i] + b.num[i] + k;
		k:=c.num[i] div 10;
		c.num[i]:=c.num[i] mod 10;
	end;
	if (k <> 0) then begin
		inc(c.len);
		c.num[c.len]:=k;
	end;
 end;

procedure print(a:bignumber);
 var
	i:longint;
 begin
	for i:=a.len downto 1 do write(a.num[i]);
	writeln;
 end;

begin
	readln(n,k);
	fillchar(f,sizeof(f),0);
	with f[0] do begin
		len:=1;
		num[1]:=1;
	end;
	for i:=1 to n do f[i].len:=1;
	for i:=1 to k do
		for j:=i to n do
			add(f[j],f[j - i],f[j]);
	print(f[n]);
end.