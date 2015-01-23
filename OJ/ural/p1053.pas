program p1053;
var n,i,j,k,a,ans:longint;
function gcd(a,b:longint):longint;
 begin
     if a mod b=0 then gcd:=b
       else gcd:=gcd(b,a mod b);
 end;

begin
    readln(n);
    read(ans);
    for i:=2 to n do begin
        read(a);
        ans:=gcd(ans,a);
        if ans=1 then break;
    end;
    writeln(ans);
end.