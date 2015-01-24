program bag; {  f[i,j]=max(f[i-1,j-w[i]]+p[i],f[i-1,j])  }
const maxm=1000;maxn=100;
type arr=array[1..maxn] of integer;
var m,n,j,i:integer;
    c,w:arr;
    f:array[0..maxm] of integer;

function max(x,y:integer):integer;
 begin
     if x>y then max:=x else max:=y;
 end;

begin
    assign(input,'01bag.in'); reset(input);
    assign(output,'01bag.out'); rewrite(output);
    readln(m,n);
    for i:= 1 to n do readln(w[i],c[i]);
    for j:=0 to m do f[j]:=0;
    for i:=1 to n do
      for j:=m downto 1 do
        if j>=w[i] then f[j]:=max(f[j-w[i]]+c[i],f[j]);
    writeln('Max Value=',f[m]);
    close(input);
    close(output);
end.
