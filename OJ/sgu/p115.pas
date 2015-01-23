program p115;
const a:array[1..12] of longint=(31,28,31,30,31,30,31,31,30,31,30,31);
var m,n,i,now:longint;
begin
    readln(n,m);
    if (a[m]<n) or (m>12) or (m<=0) or (n<=0) then begin
        writeln('Impossible');
        halt;
    end;
    now:=0;
    for i:=1 to m-1 do now:=now+a[i];
    now:=(now+n) mod 7;
    if now=0 then now:=7;
    writeln(now);
end.