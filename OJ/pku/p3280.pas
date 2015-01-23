program p3280;
const maxl=2000;
var a:array[1..maxl] of char;
    cost:array['a'..'z'] of longint;
    f:array[1..maxl,1..maxl] of longint;
    n,l,i,j,x,y,k:longint;
    ch:char;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
begin
    readln(n,l);
    for i:=1 to l do read(a[i]);
    readln;
    for i:=1 to n do begin
        read(ch);
	readln(x,y);
	cost[ch]:=min(x,y);
    end;
    for k:=1 to l do 
        for i:=1 to l-k do begin
	    j:=i+k;
	    if (i=j) or ((i+1=j) and (a[i]=a[j])) then f[i,j]:=0
		else begin
		    f[i,j]:=min(f[i+1,j]+cost[a[i]],f[i,j-1]+cost[a[j]]);
		    if a[i]=a[j] then f[i,j]:=min(f[i,j],f[i+1,j-1]);
		end;
	end;
    writeln(f[1,l]);
end.
