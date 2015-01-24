program yuebei;
var m,n,y,b,s:longint;
function f(a,b:longint):longint;
 begin
     if a mod b=0 then f:=b
     else f:=f(b,a mod b);
 end;
begin
   write('Enter two numbers=');
   read(m,n);
   y:=f(m,n);
   s:=m*n;
   b:=s div y;
   writeln('Max Gong Yue Shu:=',y);
   writeln('Min Gong Bei Shu:=',b);
end.
