program p355;
const maxn=10000;
var a:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    i,j,n,total:longint;
begin
    readln(n);
    total:=1;
    a[1]:=1;
    for i:=2 to n do begin
        for j:=1 to total do flag[j]:=true;
        for j:=1 to trunc(sqrt(i))+1 do
        	   if (i mod j=0) then begin
                flag[a[j]]:=false;
                flag[a[i div j]]:=false;
            end;
        for j:=1 to total do
           if flag[j] then break;
        if not flag[j] then begin
           inc(total); a[i]:=total;
        end else a[i]:=j;
    end;
    writeln(total);
    for i:=1 to n-1 do write(a[i],' ');
    writeln(a[n]);
end.