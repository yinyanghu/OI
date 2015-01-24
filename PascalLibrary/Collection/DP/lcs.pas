program lcs;
const
	maxlen = 100;
var
	x,y,ans:string;
	i,j,lenx,leny:longint;
	c:array[0..maxlen,0..maxlen] of longint;
begin
	readln(x); readln(y);
	lenx:=length(x);
	leny:=length(y);
	fillchar(c,sizeof(c),0);
	for i:=1 to lenx do
		for j:=1 to leny do
			if (x[i] = y[j]) then c[i,j]:=c[i - 1,j - 1] + 1
				else if (c[i - 1,j] > c[i,j - 1]) then c[i,j]:=c[i - 1,j] else c[i,j]:=c[i,j - 1];
	writeln(c[lenx,leny]);
	ans:='';
	while (lenx > 0) and (leny > 0) do
		if (x[lenx] = y[leny]) then begin
			ans:=x[lenx] + ans;
			dec(lenx); dec(leny);
		end else if (c[lenx - 1,leny] > c[lenx,leny - 1]) then dec(lenx) else dec(leny);
	writeln(ans);
end.
