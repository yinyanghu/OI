program lowfight;
var sum,total,x,y:array[1..30000] of longint;
    n,i,j:longint;
begin
    readln(n);
    for i:=1 to n do readln(x[i],y[i]);
    for i:=1 to n do
       for j:=1 to n do
          if i<>j then
            if (x[i]>=x[j]) and (y[i]>=y[j]) then inc(total[i]);
    for i:=1 to n do inc(sum[total[i]]);
    for i:=0 to n-1 do writeln(sum[i]);
end.
