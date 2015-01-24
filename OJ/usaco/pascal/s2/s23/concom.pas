{
ID:lijianx1
PROG:concom
LANG:PASCAL
}
program concom;
const maxn=100;
var n:longint;
    a:array[1..maxn,1..maxn] of longint;
    flag,con:array[1..maxn] of boolean;
    s:array[1..maxn] of longint;
procedure init;
 var m,i,x,y,k:longint;
 begin
     assign(input,'concom.in'); reset(input);
     n:=0;
     readln(m);
     fillchar(a,sizeof(a),0);
     for i:=1 to m do begin
         readln(x,y,k);
         if x>n then n:=x;
         if y>n then n:=y;
         inc(a[x,y],k);
     end;
     close(input);
 end;
 
procedure dfs(k:longint);
 var i:longint;
 begin
     if flag[k] then exit;
     flag[k]:=true;
     for i:=1 to n do begin
         inc(s[i],a[k,i]);
         if s[i]>50 then begin
             con[k]:=true;
             dfs(i);
         end;
     end;
 end;
 
procedure main;
 var i,j:longint;
 begin
     assign(output,'concom.out'); rewrite(output);
     for i:=1 to n do begin
         fillchar(flag,sizeof(flag),false);
         fillchar(con,sizeof(con),false);
         fillchar(s,sizeof(s),0);
         con[i]:=true;
         dfs(i);
         for j:=1 to n do
     	    if con[j] and (i<>j) then writeln(i,' ',j);
     end;
     close(output);
 end;


begin
    init;
    main;
end.