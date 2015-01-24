program dig;
const maxn=200;
var n,i,j:integer;
    max:longint;
    w:array[1..maxn] of integer;
    a:array[1..maxn,1..maxn] of integer;
    ok:array[1..maxn,1..maxn] of boolean;
    vis:array[1..maxn] of boolean;
    st,t:string;
procedure dfs(p,s:integer; path:string);
 var t:string;
     find:boolean;
     i:integer;
 begin
     vis[p]:=true;
     find:=false;
     for i:=1 to n do
       if (a[p,i]=1) and (not ok[p,i]) and (not vis[i]) then begin
           find:=true;
           ok[p,i]:=true;
           ok[i,p]:=true;
           str(i,t);
           dfs(i,s+w[i],path+'-'+t);
           ok[p,i]:=false;
           ok[i,p]:=false;
       end;
       if not find then if s>max then begin
           st:=path;
           max:=s;
       end;
       vis[p]:=false;
 end;


begin
    assign(input,'dig.in'); reset(input);
    readln(n);
    for i:=1 to n do read(w[i]);
    readln;
    for i:=1 to n-1 do begin
        for j:=i+1 to n do begin
            read(a[i,j]);
            a[j,i]:=a[i,j];
        end;
        readln;
    end;
    close(input);
    max:=0;
    for i:=1 to n do begin
        fillchar(ok,sizeof(ok),false);
        str(i,t);
        dfs(i,w[i],t);
    end;
    writeln(st);
    writeln('MAX=',max);
end.
