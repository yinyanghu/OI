program p105;
var n,total:longint;
begin
    readln(n);
    total:=total+(n div 3)*2;
    if (n mod 3=2) then total:=total+1;
    writeln(total);
end.
{var total,k,now,n:longint;
function f(x:longint):longint;
 var m:longint;
 begin
     m:=0;
     while x<>0 do begin
         m:=m+x mod 10;
         x:=x div 10;
     end;
     f:=m;
 end;

begin
    readln(n);
    now:=0; total:=0;
    for k:=1 to n do begin
        now:=now+f(k);
        if (now mod 3=0) then begin
            inc(total);
            now:=0;
        end;
    end;
    writeln(total);
end.}