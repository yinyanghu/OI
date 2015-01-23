program p2373;
const
	maxl=1000000;
	limitsize=1000000;
var
	f,s,t:array[0..maxl] of longint;
	stack:array[1..limitsize] of longint;
	flag:array[0..maxl] of boolean;
	n,l,a,b,i,j,x,y,head,tail:longint;
procedure prepare;
 var
	i,k:longint;
 begin
	fillchar(flag,sizeof(flag),false);
	k:=0;
	for i:=0 to l do begin
		dec(k,t[i]);
		if k = 0 then flag[i]:=true;
		inc(k,s[i]);
	end;
	for i:=0 to l do flag[i]:=flag[i] and (not odd(i));
 end;

begin
	readln(n,l);
	readln(a,b);
	a:=a shl 1; b:=b shl 1;
	fillchar(s,sizeof(s),0);
	fillchar(t,sizeof(t),0);
	for i:=1 to n do begin
		readln(x,y);
		inc(s[x]); inc(t[y]);
	end;
	prepare;
	f[0]:=0;
	head:=1; tail:=0; j:=0;
	for i:=1 to l do if flag[i] then begin
		while j + a <= i do begin
			if flag[j] then begin
				while (head <= tail) and (f[j] < f[stack[tail]]) do dec(tail);
				inc(tail); stack[tail]:=j;
			end;
			inc(j);
		end;
		while (head <= tail) and (stack[head] + b < i) do inc(head);
		if head > tail then flag[i]:=false else f[i]:=f[stack[head]] + 1;
	end;
	if flag[l] then writeln(f[l]) else writeln(-1);
end.
