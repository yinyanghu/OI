program p196;
var g:array[1..10000] of longint;
    n,m,i,x,y:longint;
    total:int64;
begin
    readln(n,m);
    fillchar(g,sizeof(g),0);
    for i:=1 to m do begin
        readln(x,y);
        inc(g[x]); inc(g[y]);
    end;
    total:=0;
    for i:=1 to n do total:=total+sqr(g[i]);
    writeln(total);
end.
