program citydis;
const max=1000;
var ga:array[1..max,1..max] of integer;
    dis:array[1..max] of integer;
    s:array[1..max] of boolean;
    n,k:integer;
procedure init;
 var i,j:integer;
 begin
     assign(input,'city2.in'); reset(input);
     readln(n,k);
     for i:=1 to n do
       for j:=1 to n do read(ga[i,j]);
     close(input);
 end;
procedure dijkstra;
 var i,j,w,m:integer;
 begin
     fillchar(s,sizeof(s),false);
     for i:=1 to n do dis[i]:=maxint;
     dis[k]:=0;
     for i:=1 to n-1 do begin
         m:=maxint;
         for j:=1 to n do if (not s[j]) and (dis[j]<m) then begin
             m:=dis[j];
             w:=j;
         end;
         s[w]:=true;
         for j:=1 to n do if (not s[j]) and (ga[w,j]>0) and
            ((dis[w]+ga[w,j])<dis[j]) then dis[j]:=dis[w]+ga[w,j];
     end;
 end;
procedure print;
 var i:integer;
 begin
     assign(output,'city2.out'); rewrite(output);
     for i:=1 to n do write(dis[i],'   ');
     close(output);
 end;
begin
    init;
    dijkstra;
    print;
end.
