program triangle3;
const maxn=100;
var a:array[1..maxn,1..maxn] of longint;
    f:array[0..maxn,0..maxn,0..9] of boolean;
    i,j,k,n:longint;
begin
    assign(input,'triangle3.in'); reset(input);
    assign(output,'triangle3.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
       for j:=1 to i do read(a[i,j]);
    fillchar(f,sizeof(f),false);
    for i:=1 to n do f[n,i,a[n,i] mod 10]:=true;
    for i:=n-1 downto 1 do
       for j:=1 to i do
          for k:=0 to 9 do
             f[i,j,k]:=f[i+1,j,(10+k-a[i,j] mod 10) mod 10] or f[i+1,j+1,(10+k-a[i,j] mod 10) mod 10];
    for i:=9 downto 0 do
      if f[1,1,i] then begin
          writeln(i);
          break;
      end;
    close(input);
    close(output);
end.