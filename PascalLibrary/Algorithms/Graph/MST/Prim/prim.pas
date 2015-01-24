program prim;
const maxn=100;
var cost:array[1..maxn,1..maxn] of integer;
    n,start:integer;
    i,j:integer;
procedure main(v0:integer);
 var lowcost,closest:array[1..maxn] of integer;
     i,j,k,min:integer;
 begin
     for i:=1 to n do begin
         lowcost[i]:=cost[v0,i];
         closest[i]:=v0;
     end;
     for i:=1 to n-1 do begin
         min:=maxint;
         for j:=1 to n do
           if (lowcost[j]<min) and (lowcost[j]<>0) then begin
               min:=lowcost[j];
               k:=j;
           end;
         writeln(closest[k]:5,k:5,cost[closest[k],k]:5);
         lowcost[k]:=0;
         for j:=1 to n do
           if cost[k,j]<lowcost[j] then begin
               lowcost[j]:=cost[k,j];
               closest[j]:=k;
           end;
     end;
 end;
begin
    assign(input,'prim.in'); reset(input);
    assign(output,'prim.out'); rewrite(output);
    readln(n,start);
    for i:=1 to n do
      for j:=1 to n do read(cost[i,j]);
    main(start);
    close(input);
    close(output);
end.