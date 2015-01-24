program extend_euclid;
var
	x,y,gcd,a,b,c:longint;
procedure swap(var a,b:longint);
 var
	k:longint;
 begin
	k:=a; a:=b; b:=k;
 end;
 
function extend(a,b:longint; var x,y:longint):longint;
 var
	xx,yy:longint;
 begin
	if (b = 0) then begin
		x:=1; y:=0; 
		exit(a);
	end;
	extend:=extend(b,a mod b,xx,yy);
	x:=yy; y:=xx - (a div b) * yy;
 end;
 
begin
	readln(a,b,c);
	if (a > b) then swap(a,b);
	gcd:=extend(a,b,x,y);
	if (c mod gcd <> 0) then begin
		writeln('No Solution');
		halt;
	end;
	x:=x * c div gcd;
	y:=y * c div gcd;
	writeln(a,'X + ',b,'Y = ',c);
	writeln('X = ',x);
	writeln('Y = ',y);
end.
