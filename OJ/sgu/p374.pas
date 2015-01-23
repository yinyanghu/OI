program p374;
const
	maxl = 50;
var
	c:array[1..maxl] of longint;
	w,a,b,k,i:longint;

procedure multiply;
 var
	i,k:longint;
 begin
 	k:=0;
 	for i:=1 to maxl do begin
 		c[i]:=c[i] * w + k;
 		k:=c[i] div 10;
 		c[i]:=c[i] mod 10;
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
	readln(a,b,k);
	fillchar(c,sizeof(c),0);
	w:=a + b;
	c[1]:=1;
	for i:=1 to k do multiply;
	print;
end.