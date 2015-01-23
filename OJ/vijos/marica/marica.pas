program marica;
const maxn=1000;
var g:array[1..maxn,1..maxn] of longint;
    path:array[1..maxn] of longint;
    i,n,p,l,q,m,total,now,max:longint;

procedure find;
 var min,i,k:longint;
     dist,pre:array[1..maxn] of longint;
     vis:array[1..maxn] of boolean;
 begin
     for i:=1 to n do dist[i]:=maxlongint;
     dist[1]:=0;
     fillchar(vis,sizeof(vis),false);
     fillchar(pre,sizeof(pre),0);
     repeat
         min:=maxlongint;
         k:=0;
         for i:=1 to n do
           if (not vis[i]) and (dist[i]<min) then begin
               min:=dist[i];
               k:=i;
           end;
           if k=0 then break;
           vis[k]:=true;
           for i:=1 to n do
             if (min+g[k,i]<dist[i]) and (g[k,i]<>0) then begin
                 dist[i]:=min+g[k,i];
                 pre[i]:=k;
             end;
     until false;
     fillchar(path,sizeof(path),0);
     k:=n; total:=0;
     while k<>1 do begin
         inc(total);
         path[total]:=k;
         k:=pre[k];
     end;
     path[total+1]:=1;
 end;

function distant:longint;
 var min,i,k:longint;
     dist,pre:array[1..maxn] of longint;
     vis:array[1..maxn] of boolean;
 begin
     for i:=1 to n do dist[i]:=maxlongint;
     dist[1]:=0;
     fillchar(vis,sizeof(vis),false);
     repeat
         min:=maxlongint;
         k:=0;
         for i:=1 to n do
           if (not vis[i]) and (dist[i]<min) then begin
               min:=dist[i];
               k:=i;
           end;
           if k=0 then break;
           vis[k]:=true;
           for i:=1 to n do
             if (min+g[k,i]<dist[i]) and (g[k,i]<>0) then
                 dist[i]:=min+g[k,i];
     until false;
     distant:=dist[n];
 end;

begin
    assign(input,'marica10.in'); reset(input);
    readln(n,m);
    fillchar(g,sizeof(g),0);
    for i:=1 to m do begin
        readln(p,q,l);
        g[p,q]:=l;
        g[q,p]:=l;
    end;
    close(input);
    find; max:=0;
    for i:=1 to total do begin
        p:=g[path[i],path[i+1]];
        g[path[i+1],path[i]]:=0;
        g[path[i],path[i+1]]:=0;
        now:=distant;
        if now>max then max:=now;
        g[path[i],path[i+1]]:=p;
        g[path[i+1],path[i]]:=p;
    end;
    assign(output,'marica.out'); rewrite(output);
    writeln(max);
    close(output);
end.