program house;
var a:array[1..1000,1..1000] of integer;
    f:array[0..1000,0..1000] of longint;
    n,m,i,j,k,l,max:longint;
function min(a,b,c:longint):longint;
 begin
     if a>b then min:=b
       else min:=a;
     if c<min then min:=c;
 end;

begin
    assign(input,'house.in'); reset(input);
    readln(n,m);
    for i:=1 to n do
      for j:=1 to m do read(a[i,j]);
    close(input);
    fillchar(f,sizeof(f),0);
    max:=0;
    for i:=1 to n do
      for j:=1 to m do begin
          if a[i,j]=1 then f[i,j]:=min(f[i,j-1],f[i-1,j],f[i-1,j-1])+1;
          if f[i,j]>max then max:=f[i,j];
      end;
    writeln(max);
end.