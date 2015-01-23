program p1005;
var n,i,min,total:longint;
    a:array[1..20] of longint;
procedure dfs(k,now,rest:longint);
 var i:longint;
 begin
     if abs(now-rest)<min then min:=abs(now-rest);
     for i:=k to n do
       dfs(i+1,now+a[i],rest-a[i]);
 end;

begin
    read(n);
    total:=0;
    for i:=1 to n do begin
        read(a[i]);
        total:=total+a[i];
    end;
    min:=maxlongint;
    dfs(1,0,total);
    writeln(min);
end.
