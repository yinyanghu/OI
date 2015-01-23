{program distant;
const maxn=1000;
var g:array[1..maxn,1..maxn] of longint;
    dis:array[1..maxn] of longint;
    s:array[1..maxn] of boolean;
    n,k:longint;
procedure init;
 var i,j:longint;
 begin
     assign(input,'distant.in'); reset(input);
     readln(n,k);
     for i:=1 to n do
       for j:=1 to n do read(g[i,j]);
     close(input);
 end;

procedure dijkstra;
 var i,j,w,m:longint;
 begin
     fillchar(s,sizeof(s),false);
     for i:=1 to n do dis[i]:=maxint;
     dis[k]:=0;
     for i:=1 to n-1 do begin
         m:=maxint;
         for j:=1 to n do
           if (s[j]=false) and (dis[j]<m)  then begin
               m:=dis[j];
               w:=j;
           end;
         s[w]:=true;
         for j:=1 to n do
           if (s[j]=false) and (g[w,j]>0) and (dis[w]+g[w,j]<dis[j]) then
               dis[j]:=dis[w]+g[w,j];
     end;
 end;

procedure print;
 var i:longint;
 begin
     assign(output,'distant.out'); rewrite(output);
     for i:=1 to n do write(dis[i],' ');
     close(output);
 end;

begin
    init;
    dijkstra;
    print;
end.
}

program distant;
const maxn=1000;
var g:array[1..maxn,1..maxn] of longint;
    dis:array[1..maxn] of longint;
    s:array[1..maxn] of boolean;
    n,k:longint;
procedure init;
 var i,j:longint;
 begin
     assign(input,'distant.in'); reset(input);
     readln(n,k);
     for i:=0 to n-1 do
       for j:=0 to n-1 do read(g[i,j]);
     close(input);
 end;

procedure dijkstra;
 var i,j,w,m:longint;
 begin
     fillchar(s,sizeof(s),false);
     for i:=0 to n-1 do dis[i]:=g[k,i];
     dis[k]:=0;
     for i:=1 to n-1 do begin
         m:=maxint;
         for j:=0 to n-1 do
           if (s[j]=false) and (dis[j]<m) then begin
               m:=dis[j];
               w:=j;
           end;
         s[w]:=true;
         for j:=0 to n-1 do
           if (s[j]=false) and (g[w,j]>0) and (dis[w]+g[w,j]<dis[j]) then
               dis[j]:=dis[w]+g[w,j];
     end;
 end;

procedure print;
 var i:longint;
 begin
     assign(output,'distant.out'); rewrite(output);
     for i:=0 to n-1 do begin
         write('From ',k,' to ',i,':');
         if dis[i]>0 then writeln(dis[i]) else writeln('No Path!');
     end;
     close(output);
 end;

begin
    init;
    dijkstra;
    print;
end.
