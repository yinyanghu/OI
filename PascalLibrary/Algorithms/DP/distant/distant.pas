program distant; { f(x)=f(k)+d[x,k] }
const maxn=100;
var a:array[1..maxn,1..maxn] of integer;
    b,c:array[1..maxn] of integer;
    i,j,k,n:integer;
begin
    assign(input,'distant.in'); reset(input);
    readln(n);
    for i:=1 to n do
      for j:=1 to n do read(a[i,j]);
    close(input);
    for i:=1 to n do b[i]:=maxint;
    b[n]:=0;
    for i:=n-1 downto 1 do
      for j:=n downto i+1 do
        if (a[i,j]>0) and (b[j]<>maxint) and (b[j]+a[i,j]<b[i])
          then begin
              b[i]:=b[j]+a[i,j];
              c[i]:=j;
          end;
    assign(output,'distant.out'); rewrite(output);
    writeln('MinLong=',b[1]);
    k:=1; write(k,'--->');
    while k<>0 do begin
        k:=c[k];
        if k<>0 then if c[k]<>0 then write(k,'--->')
          else write(k);
    end;
    close(output);
end.
