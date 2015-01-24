program comman;
var a,b:string;
    i,j,k,l1,l2,n,m:longint;
    f:array[0..200,0..200] of longint;
function max(a,b,c:longint):longint;
 begin
     if a>b then max:=a
       else max:=b;
     if max<c then max:=c;
 end;

begin
    readln(a); readln(b);
    l1:=length(a); l2:=length(b);
    fillchar(f,sizeof(f),0);
    if a[1]=b[1] then f[1,1]:=1;
    for i:=1 to l1 do
      for j:=1 to l2 do
          if a[i]=b[j] then
             f[i,j]:=max(f[i-1,j-1]+1,f[i,j-1],f[i-1,j])
                else f[i,j]:=max(-maxlongint,f[i,j-1],f[i-1,j]);
    writeln(f[l1,l2]);
end.