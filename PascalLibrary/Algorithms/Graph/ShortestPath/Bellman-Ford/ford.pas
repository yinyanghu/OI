program bellmanford;
const maxn=30;
var n,s,t:integer;
    dist:array[1..maxn] of double;
    g:array[1..maxn,1..maxn] of double;
    pre:array[1..maxn] of integer;
    vis:array[1..maxn] of boolean;
procedure init;
 var i,j:integer;
 begin
     assign(input,'ford.in'); reset(input);
     read(n);
     for i:=1 to n do
       for j:=1 to n do
         g[i,j]:=1e100;
     for i:=1 to n do
       for j:=1 to n do read(g[i,j]);
     read(s,t);
     close(input);
 end;

procedure main;
 var i,j:integer;
     change:boolean;
 begin
     for i:=1 to n do dist[i]:=1e100;
     dist[s]:=0;
     repeat
        change:=false;
        for i:=1 to n do
          for j:=1 to n do
            if (dist[i]+g[i,j]<dist[j]) then begin
                dist[j]:=dist[i]+g[i,j];
                pre[j]:=i;
                change:=true;
            end;
     until not change;
 end;

procedure print;
 var k,len,i:integer;
     path:array[1..maxn] of integer;
 begin
     assign(output,'ford.out'); rewrite(output);
     if (dist[t]>1e99) then writeln('No Solution!')
       else begin
           len:=0;
           k:=t;
           while (k<>s) do begin
               inc(len);
               path[len]:=k;
               k:=pre[k];
           end;
           writeln('Length=',dist[t]:0:0);
           write(s);
           for i:=len downto 1 do write('--->',path[i]);
           writeln;
       end;
     close(output);
 end;

begin
    init;
    main;
    print;
end.
