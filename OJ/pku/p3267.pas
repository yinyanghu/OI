program p3267;
const
	maxw = 600;
	maxl = 300;
var
	s:array[1..maxl] of char;
	a:array[1..maxw] of string;
	len:array[1..maxw] of longint;
	f:array[0..maxl] of longint;
	w,l,i,j,x,y:longint;

function min(a,b:longint):longint;inline;
 begin
 	if (a < b) then min:=a else min:=b;
 end;

begin
	readln(w,l);
	for i:=1 to l do read(s[i]);
	readln;
	for i:=1 to w do begin
		readln(a[i]);
		len[i]:=length(a[i]);
	end;
	f[0]:=0;
	for i:=1 to l do begin
		f[i]:=i;
		for j:=1 to w do begin
			x:=i; y:=len[j];
			if (x < y) then continue;
			while (x > 0) and (y > 0) do
				if (s[x] = a[j][y]) then begin
					dec(x); dec(y);
				end else dec(x);
			if (y = 0) then f[i]:=min(f[i],f[x] + i - x - len[j]);
		end;
	end;
	writeln(f[l]);
end.