program p407;
const
	maxl = 1500;
	modnum = 1000000;
type
	bignumber = record
		len:longint;
		num:array[1..maxl] of longint;
	end;
var
	f,g:array[boolean] of bignumber;
	i,n,m:longint;
	flag:boolean;

function plus(a,b:bignumber):bignumber;
 var
	c:bignumber;
	i,k:longint;
 begin
	fillchar(c,sizeof(c),0);
	if (a.len > b.len) then c.len:=a.len else c.len:=b.len;
	k:=0;
	for i:=1 to c.len do begin
		c.num[i]:=a.num[i] + b.num[i] + k;
		k:=c.num[i] div modnum;
		c.num[i]:=c.num[i] mod modnum;
	end;
	if (k <> 0) then begin
		inc(c.len);
		c.num[c.len]:=k;
	end;
	plus:=c;
 end;

function multiply(a:bignumber; b:longint):bignumber;
 var
	c:bignumber;
	i,k:longint;
 begin
	fillchar(c,sizeof(c),0);
	c.len:=a.len;
	k:=0;
	for i:=1 to c.len do begin
		c.num[i]:=a.num[i] * b + k;
		k:=c.num[i] div modnum;
		c.num[i]:=c.num[i] mod modnum;
	end;
	while (k <> 0) do begin
		inc(c.len);
		c.num[c.len]:=k mod modnum;
		k:=k div modnum;
	end;
	multiply:=c;
 end;

procedure print(x:bignumber);
 var
	i,k:longint;
 begin
	for i:=x.len downto 1 do begin
		if (i <> x.len) then begin
			k:=10;
			while (k <> modnum) do begin
				if (x.num[i] < k) then write('0');
				k:=k * 10;
			end;
		end;
		write(x.num[i]);
	end;
	writeln;
 end;


begin
	readln(n,m);
	if (m = 0) then begin
		writeln(1);
		halt;
	end;
	flag:=false;
	with f[flag] do begin
		len:=1;
		num[1]:=0;
	end;
	with g[flag] do begin
		len:=1;
		num[1]:=1;
	end;
	for i:=2 to m do begin
		f[not flag]:=multiply(g[flag],n);
		g[not flag]:=plus(multiply(g[flag],2),f[flag]);
		flag:=not flag;
	end;
	print(f[flag]);
end.
