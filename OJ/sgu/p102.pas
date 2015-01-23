program p102;
var n,i,j,k,total:longint;
function gcd(a,b:longint):longint;
 begin
     if a mod b=0 then gcd:=b
       else gcd:=gcd(b,a mod b);
 end;

begin
    readln(n);
    total:=1;
    for k:=2 to n-1 do begin
        if gcd(k,n)=1 then inc(total);
    end;
    writeln(total);
end.