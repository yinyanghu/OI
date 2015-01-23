program p1947;
const maxn=150;
      maxp=150;
      root=1;
type node=record
         size:longint;
         v:array[1..maxn] of longint;
     end;
var f:array[1..maxn,0..maxp] of longint;
    a:array[1..maxn] of node;
    n,p,i,ans,x,y,j:longint;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
procedure dp(x:longint);
 var i,j,k:longint;
 begin
     for i:=1 to a[x].size do dp(a[x].v[i]);
     f[x,1]:=a[x].size;
     for i:=1 to a[x].size do
     	for k:=p-1 downto 0 do
             if f[x,k]<maxint then
             	for j:=1 to p-1 do
                     if f[a[x].v[i],j]<maxint then f[x,k+j]:=min(f[x,k+j],f[x,k]+f[a[x].v[i],j]-1);
 end;
 
begin
    readln(n,p);
    fillchar(a,sizeof(a),0);
    for i:=1 to n-1 do begin
        readln(x,y);
        inc(a[x].size);
        a[x].v[a[x].size]:=y;
    end;
    for i:=1 to n do
        for j:=0 to p do f[i,j]:=maxint;
    dp(root);
    ans:=f[root,p];
    for i:=2 to n do ans:=min(ans,f[i,p]+1);
    writeln(ans);
end.