program p3274;
const
	maxn = 100000;
	maxk = 30;
	limitsize = 1000000;
	prime = 997001;
type
	bit = array[0..maxk] of longint;
var
	hash:array[0..limitsize] of longint;
	f:array[0..maxn] of bit;
	n,k,a,t,i,w,ans:longint;
function find(x:bit):longint;
 var
	i,p:longint;
	flag:boolean;
 begin
	p:=0;
	for i:=0 to k do
		p:=((p shl 2) + (x[i] shr 4)) xor (x[i] shl 10);
	p:=p mod prime;
	if (p < 0) then p:=p + prime;
	flag:=false;
	while (not flag) and (hash[p] <> -1) do begin
		flag:=true;
		for i:=0 to k do
			if (x[i] <> f[hash[p]][i]) then begin
				flag:=false;
				break;
			end;
		inc(p);
	end;
	if flag then dec(p);
	find:=p;
 end;
 
begin
	fillchar(hash,sizeof(hash),255);
	readln(n,k); dec(k);
	for i:=0 to k do f[0][i]:=0;
	hash[find(f[0])]:=0;
	ans:=0;
	for i:=1 to n do begin
		readln(a);
		t:=a and 1;
		w:=0;
		while (w < k) do begin
			a:=a shr 1;
			f[i,w]:=f[i - 1,w] + (a and 1) - t;
			inc(w);
		end;
		w:=find(f[i]);
		if (hash[w] = -1) then hash[w]:=i;
		if (i - hash[w] > ans) then ans:=i - hash[w];
	end;
	writeln(ans);
end.