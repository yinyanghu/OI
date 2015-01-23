program p3046;
const
	maxn = 1000;
	maxm = 100000;
	prime = 1000000;
var
	w:array[1..maxn] of longint;
	f:array[0..1,0..maxm] of longint;
	t,a,s,b,i,x,ans,j,sum,pre,cur:longint;
begin
	readln(t,a,s,b);
	fillchar(w,sizeof(w),0);
	for i:=1 to a do begin
		readln(x);
		inc(w[x]);
	end;
	pre:=1; cur:=0;
	for i:=0 to w[1] do f[cur,i]:=1;
	for i:=2 to t do begin
		pre:=pre xor 1;
		cur:=cur xor 1;
		sum:=0;
		for j:=0 to w[i] do begin
			sum:=(sum + f[pre,j]) mod prime;
			f[cur,j]:=sum;
		end;
		while (j <= b) do begin
			inc(j);
			sum:=(sum + f[pre,j] - f[pre,j - w[i] - 1]) mod prime;
			f[cur,j]:=sum;

		end;
	end;
	ans:=0;
	for i:=s to b do ans:=(ans + f[cur,i]) mod prime;
	if (ans < 0) then ans:=ans + prime;
	writeln(ans);
end.