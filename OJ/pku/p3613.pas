program p3613;
const
	maxt = 100;
	maxl = 20;
	maxn = 1000;
	infinity = 2000000000;
var
	f:array[0..maxl,1..maxt,1..maxt] of longint;
	ans:array[boolean,1..maxt] of longint;
	hash:array[1..maxn] of longint;
	v,n,t,s,e:longint;
function change(x:longint):longint;
 begin
	if (hash[x] = -1) then begin
		inc(v);
		hash[x]:=v;
	end;
	change:=hash[x];
 end;

function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;

procedure init;
 var
	i,x,y,len:longint;
 begin
	fillchar(hash,sizeof(hash),255);
	fillchar(f,sizeof(f),$7F);
	readln(n,t,s,e);
	v:=0;
	s:=change(s); e:=change(e);
	for i:=1 to t do begin
		readln(len,x,y);
		x:=change(x); y:=change(y);
		f[0,x,y]:=min(f[0,x,y],len);
		f[0,y,x]:=min(f[0,y,x],len);
	end;
 end;

procedure main;
 var
	i,j,k,w:longint;
	flag:boolean;
 begin
	w:=1;
	while (1 shl w <= n) do begin
		for k:=1 to v do
			for i:=1 to v do
				if (f[w - 1,i,k] < infinity) then
					for j:=1 to v do
						if (f[w - 1,k,j] < infinity) then f[w,i,j]:=min(f[w,i,j],f[w - 1,i,k] + f[w - 1,k,j]);
		inc(w);
	end;
	flag:=false;
	fillchar(ans[flag],sizeof(ans[flag]),$7F);
	ans[flag,s]:=0;
	w:=0;
	while (1 shl w <= n) do begin
		if (n and (1 shl w) = 0) then begin
			inc(w);
			continue;
		end;
		flag:=not flag;
		fillchar(ans[flag],sizeof(ans[flag]),$7F);
		for i:=1 to v do
			if (ans[not flag,i] < infinity) then
				for j:=1 to v do
					if (f[w,i,j] < infinity) then ans[flag,j]:=min(ans[flag,j],ans[not flag,i] + f[w,i,j]);
		inc(w);
	end;
	writeln(ans[flag,e]);
 end;

begin
	init;
	main;
end.
