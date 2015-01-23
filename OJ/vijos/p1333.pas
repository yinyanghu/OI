program p1333;
var p,k,n:longint;
begin
   readln(n);
   p:=round(sqrt(n*2));
   k:=p*(p+1) div 2;
   if p mod 2=0 then writeln(p-k+n,'/',k-n+1)
      else writeln(k-n+1,'/',p-k+n);
end.