program triangle;
const maxn=1000;
{var ans,a:array[1..maxn,1..maxn] of longint;
    i,j,n,k,total:longint;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

function dfs(x,y:longint):longint;
 begin
     if x=4 then exit(a[x,y]);
     if ans[x,y]=0 then begin
         dfs:=max(dfs(x+1,y),dfs(x+1,y+1))+a[x,y];
         ans[x,y]:=dfs;
     end else dfs:=ans[x,y];
 end;

begin
    assign(input,'triangle.in'); reset(input);
    assign(output,'triangle.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
      for j:=1 to i do read(a[i,j]);
    fillchar(ans,sizeof(ans),0);
    total:=dfs(1,1);
    writeln(total);
    close(input);
    close(output);
end.}

var a,f:array[1..maxn,1..maxn] of longint;
    i,j,n:longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    assign(input,'triangle.in'); reset(input);
    assign(output,'triangle.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
       for j:=1 to i do read(a[i,j]);
    fillchar(f,sizeof(f),0);
    for i:=n downto 1 do
       for j:=1 to i do
         f[i,j]:=max(f[i+1,j],f[i+1,j+1])+a[i,j];
    writeln(f[1,1]);
    close(input);
    close(output);
end.