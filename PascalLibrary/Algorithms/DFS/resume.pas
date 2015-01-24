program resume;
const maxn=50;
var n:integer;
    a:array[1..maxn] of integer;
    g:array[1..maxn,1..maxn] of boolean;
    ok:array[1..maxn] of boolean;
procedure init;
 var u,v:integer;
 begin
     assign(input,'resume.in'); reset(input);
     readln(n);
     fillchar(g,sizeof(g),false);
     while not seekeof do begin
         readln(u,v);
         g[u,v]:=true;
         g[v,u]:=true;
     end;
     close(input);
 end;

procedure search(k:integer);
 var i:integer;
 begin
     if k>n then begin
         if g[a[1]][a[n]] then begin
             for i:=1 to n-1 do write(a[i],' ');
             writeln(a[n]);
             halt;
         end;
         exit;
     end;
     for i:=1 to n do
       if (not ok[i]) and (g[a[k-1]][i]) then begin
           a[k]:=i;
           ok[i]:=true;
           search(k+1);
           ok[i]:=false;
       end;
 end;

begin
    init;
    fillchar(ok,sizeof(ok),false);
    a[1]:=1;
    ok[1]:=true;
    search(2);
end.