{
ID:lijianx1
PROG:pprime
LANG:PASCAL
}
program pprime;
var a,b,i,j,k,p,t,w:longint;
    s:string;
function check(x:longint):boolean;
 var i:longint;
 begin
     for i:=2 to trunc(sqrt(x)) do
        if x mod i=0 then exit(false);
     check:=true;
 end;

function getlen(x:longint):longint;
 begin
     getlen:=trunc(ln(x)/ln(10))+1;
 end;

function power(x,y:longint):longint;
 var i,k:longint;
 begin
     k:=1;
     for i:=1 to y do k:=k*x;
     power:=k;
 end;

begin
    assign(input,'pprime.in'); reset(input);
    assign(output,'pprime.out'); rewrite(output);
    readln(a,b);
    close(input);
    for i:=getlen(a) to getlen(b) do begin
        if odd(i) then w:=i div 2+1 else w:=i div 2;
        for j:=power(10,w-1) to power(10,w)-1 do begin
	    p:=j; str(j,s);
	    if odd(i) then t:=w-1 else t:=w;
	    for k:=t downto 1 do p:=p*10+(ord(s[k])-48);
	    if p>b then begin
		close(output); halt;
	    end;
	    if (p>=a) and (check(p)) then writeln(p);
	end;
    end;
    close(output);
end.
