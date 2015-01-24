program triangle2;
const maxn=100;
var f:array[0..maxn,0..maxn,0..1] of longint;
    c:array[1..maxn,1..maxn] of longint;
    i,j,k,n:longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    assign(input,'triangle2.in'); reset(input);
    assign(output,'triangle2.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
      for j:=1 to i do read(c[i,j]);
    for i:=n downto 1do
       for j:=1 to i do begin
           f[i,j,0]:=max(f[i+1,j,0],f[i+1,j+1,0])+c[i,j];
           f[i,j,0]:=max(f[i,j,0],f[i+1,0,1]+c[i,j]);
           f[i,j,1]:=max(f[i+1,j+1,1],f[i+1,j,1])+c[i,j];
           if f[i,j,1]>f[i,0,1] then f[i,0,1]:=f[i,j,1];
       end;
    writeln(f[1,1,0]);
    close(input);
    close(output);
end.
