program trinumber; { f[i,j]=max(a[i,j]+f[i+1,j],a[i,j]+f[i+1,j+1]) }
const maxn=100;
var n,i,j:integer;
    a:array[1..maxn,1..maxn] of integer;
    f:array[1..maxn] of integer;
    total:integer;
begin
    assign(input,'trinumber.in'); reset(input);
    readln(n);
    for i:=1 to n do
      for j:=1 to i do read(a[i,j]);
    close(input);
    fillchar(f,sizeof(f),0);
    f[1]:=a[1,1];
    for i:=2 to n do begin
       for j:=i downto 2 do
          if f[j-1]>f[j] then f[j]:=a[i,j]+f[j-1]
            else f[j]:=a[i,j]+f[j];
        f[1]:=a[i,1]+f[1];
    end;
    total:=0;
    for i:=1 to n do
      if f[i]>total then total:=f[i];
    assign(output,'trinumber.out'); rewrite(output);
    writeln('Max=',total);
    close(output);
end.