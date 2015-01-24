program medic;
type node=record
         t,v:longint;
     end;
var t,m,i,j:longint;
    a:array[1..100] of node;
    f:array[0..1000] of longint;
begin
    assign(input,'medic.in'); reset(input);
    readln(t,m);
    for i:=1 to m do read(a[i].t,a[i].v);
    fillchar(f,sizeof(f),0);
    close(input);
    for i:=1 to m do
      for j:=t downto 1 do
          if (j>=a[i].t) and (a[i].v+f[j-a[i].t]>f[j])
            then f[j]:=a[i].v+f[j-a[i].t];
    assign(output,'medic.out'); rewrite(output);
    writeln(f[t]);
    close(output);
end.