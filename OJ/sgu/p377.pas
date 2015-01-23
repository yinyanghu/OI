program p377;
const
	maxl = 500;
var
	k,n,m,i:longint;
	a,b,c:array[1..maxl] of longint;
	
procedure multiply;
 var
 	i,k:longint;
 begin
 	k:=0;
 	for i:=1 to maxl do begin
 		a[i]:=a[i] * 2 + k;
 		k:=a[i] div 10;
 		a[i]:=a[i] mod 10;
 	end;
 end;
 
procedure plus;
 var
 	i,k:longint;
 begin
 	k:=0;
 	for i:=1 to maxl do begin
 		c[i]:=a[i] + b[i] + k;
 		k:=c[i] div 10;
 		c[i]:=c[i] mod 10;
 	end;
 end;
 
procedure minus;
 var
 	k:longint;
 begin
 	c[1]:=c[1] - 2;
 	k:=1;
 	while (c[k] < 0) do begin
 		c[k]:=10 + c[k];
 		inc(k);
 		dec(c[k]);
 	end;
 end;
 
procedure print;
 var
 	i,k:longint;
 begin
 	k:=maxl;
 	while (k > 1) and (c[k] = 0) do dec(k);
 	for i:=k downto 1 do write(c[i]);
 	writeln;
 end;
 
begin
	readln(n,m);
	if (n > m) then begin
		k:=n; n:=m; m:=k;
	end;
	fillchar(a,sizeof(a),0);
	a[1]:=1;
	for i:=1 to m do begin
		multiply;
		if (i = n) then b:=a;
	end;
	plus;
	minus;
	print;
end.
