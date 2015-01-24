program dijkstra;
uses crt;
const maxn=30;

var n,s:integer;
    dist:array[1..maxn] of double;
    g:array[1..maxn,1..maxn] of double;
    pre:array[1..maxn] of integer;
    vis:array[1..maxn] of boolean;

procedure init;
 var m,i,u,v:integer;
 begin
     clrscr;
     assign(input,'dijkstra.in'); reset(input);
     readln(n,m,s);
     for u:=1 to n do
       for v:=1 to n do g[u,v]:=1e100;
     for i:=1 to m do read(u,v,g[u,v]);
     close(input);
 end;

procedure main;
 var min:double;
     i,k:integer;
 begin
     for i:=1 to n do dist[i]:=1e100;
     dist[s]:=0;
     fillchar(pre,sizeof(pre),0);
     fillchar(vis,sizeof(vis),false);
     repeat
          min:=1e99;
          k:=0;
          for i:=1 to n do
            if not vis[i] and (dist[i]<min) then begin
                min:=dist[i];
                k:=i;
            end;
            if k=0 then break;
            vis[k]:=true;
            for i:=1 to n do
              if (min+g[k,i]<dist[i]) then begin
                  dist[i]:=min+g[k,i];
                  pre[i]:=k;
              end;
     until false;
 end;

procedure print;
 var k,length,i,t:integer;
     path:array[1..maxn] of integer;
 begin
     for t:=1 to n do begin
          writeln('********************');
          writeln('Way:',s,'--->',t);
          if (dist[t]>maxlongint) then writeln('No solution!') else begin
             length:=0;
             k:=t;
             while (k<>s) do begin
                 inc(length);
                 path[length]:=k;
                 k:=pre[k];
             end;
             writeln('length=',dist[t]:0:0);
             write(s);
             for i:=length downto 1 do write('--->',path[i]);
             writeln;
         end;
     end;
 end;

begin
    init;
    main;
    print;
end.