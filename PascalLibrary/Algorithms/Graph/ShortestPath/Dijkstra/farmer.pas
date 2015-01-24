program farmer;

const maxn=15;
      maxs=1000;
      name:array[1..10] of string[4]=('MWSV','MWS','MWV','MSV','MS','WV','W','S','V','(\)');

var gh:array[1..maxn,1..maxn] of integer;
    n,v:integer;
    dist:array[1..maxn] of integer;
    vs:array[1..maxn] of boolean;
    path:array[1..maxn] of byte;

procedure init;
var i,j:integer;
    name:string[50];
begin
    assign(input,'farmer.in');reset(input);
    readln(n,v);
    for i:=1 to n do
      for j:=1 to n do read(gh[i,j]);
    close(input);
end;

procedure work;
var i,j,k,w:integer;
begin
    for i:=1 to n do begin
        dist[i]:=maxint;
        path[i]:=v;
        vs[i]:=false;
    end;
    dist[v]:=0; path[v]:=0; vs[v]:=true;
    for i:=1 to n-1 do begin
        w:=maxs;
        for j:=1 to n do
          if not vs[j] and (dist[j]<w) then begin
              k:=j;
              w:=dist[j];
          end;
          vs[k]:=true;
          for j:=1 to n do
             if (not vs[j]) and (gh[k,j]>0) and
                 (dist[k]+gh[k,j]<dist[j]) then begin
                     dist[j]:=dist[k]+gh[k,j];
                     path[j]:=k;
                 end;
    end;
end;

procedure print;
var i,j:integer;
    s,t:string;
begin
    assign(output,'farmer.out'); rewrite(output);
    writeln('All the shortest ways:');
    for i:=1 to n do begin
        write('To',i:3,':');
        if dist[i]=maxs then writeln('':36,'No Way!') else begin
           s:=name[i];j:=path[i];
            while j<>0 do begin
                t:=name[j];
                s:=t+'-->'+s;
                j:=path[j];
            end;
            writeln(s:40,'          dist=',dist[i]);
        end;
    end;
    close(output);
end;

begin
    init;
    work;
    print;
end.

{
10 1
0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 1 1 0 0
0 0 0 0 0 1 1 0 1 0
0 0 0 0 0 0 0 1 1 0
0 0 0 0 0 0 0 1 0 1
1 0 1 0 0 0 0 0 0 0
0 1 1 0 0 0 0 0 0 0
0 1 0 1 1 0 0 0 0 0
0 0 1 1 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0 0
}
