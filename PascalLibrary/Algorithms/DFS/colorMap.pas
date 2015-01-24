program color;
const maxn=10;
var n,m,total:integer;
    a:array[1..maxn] of integer;
    g:array[1..maxn,1..maxn] of boolean;

procedure init;
 var i,u,v:integer;
 begin
     assign(input,'colorMap.in'); reset(input);
     read(n,m);
     fillchar(g,sizeof(g),false);
     for i:=1 to m do begin
         read(u,v);
         g[u,v]:=true;
         g[v,u]:=true;
     end;
     close(input);
 end;

procedure search(k:integer);
 var i:integer;
     r:array[1..maxn] of boolean;
 begin
     if k>n then begin
         writeln(total);
         close(output);
         halt;
     end;
     fillchar(r,sizeof(r),false);
     for i:=1 to k-1 do
       if g[k,i] then r[a[i]]:=true;
     for i:=1 to total do if not r[i] then begin
         a[k]:=i;
         search(k+1);
     end;
 end;

begin
    init;
    assign(output,'colorMap.out'); rewrite(output);
    for total:=1 to n do search(1);
    close(output);
end.