program energy;
const
	maxn = 200;
var
	f:array[0..maxn,0..maxn] of longint;
	a:array[0..maxn * 2] of longint;
	max,i,j,k,len,n:longint;
	
begin
	readln(n);
	for i:=1 to n do begin
		read(a[i]);
		a[i + n]:=a[i];
	end;
	a[0]:=a[n];
	fillchar(f,sizeof(f),0);
	for len:=1 to n do
		for i:=1 to 2 * n - len do begin
			j:=i + len;
			max:=0;
			for k:=i to j - 1 do
				if (f[i,k] + f[k + 1,j] + a[i - 1] * a[j] * a[k] > max) then
					max:=f[i,k] + f[k + 1,j] + a[i - 1] * a[j] * a[k];
			f[i,j]:=max;
		end;
	max:=0;
	for i:=1 to n do
		if (f[i,i + n - 1] > max) then max:=f[i,i + n - 1];
	writeln(max);
end.
