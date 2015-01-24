program knapsack; { f(x)=max(f(x-w[i])+c[i]) }
const maxm=2000;
      maxn=30;
var m,n,j,i,s:integer;
    c,w:array[0..maxn] of integer;
    f:array[0..maxm] of integer;
begin
    assign(input,'knapsack.in'); reset(input);
    readln(m,n);
    for i:= 1 to n do readln(w[i],c[i]);
    close(input);
    f[0]:=0;
    for i:=1 to m do
      for j:=1 to n do begin
          if i>=w[j]  then s:=f[i-w[j]]+c[j];
          if s>f[i] then f[i]:=s
      end;
    assign(output,'knapsack.out'); rewrite(output);
    writeln('Max Value=',f[m]);
    close(output);
end.