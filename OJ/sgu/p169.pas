program p169;
var n,total:longint;
begin
    readln(n);
    if n=1 then total:=8
      else begin
          total:=1;
          if (n-1) mod 3=0 then total:=total+2;
          if (n-1) mod 6=0 then inc(total);
      end;
    writeln(total);
end.
{
var a:array[1..1000000] of boolean;
    i,j,k,m,n,total:longint;
function p(x:longint):longint;
 var s,k:longint;
 begin
     s:=1;
     while x<>0 do begin
         k:=x mod 10;
         s:=s*k;
         if s=0 then begin
             p:=0;
             exit;
         end;
         x:=x div 10;
     end;
     p:=s;
 end;

begin
    readln(n);
    fillchar(a,sizeof(a),)
end.}