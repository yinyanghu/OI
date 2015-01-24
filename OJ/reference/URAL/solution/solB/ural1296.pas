var
        i,j,n,maxm      :       longint;
        f               :       array[0..60000] of longint;

function max(a,b:longint):longint;
begin
  if a>b then max:=a else max:=b;
end;

begin
  readln(n);
  for i:=1 to n do
    begin
      readln(j);
      f[i]:=max(f[i-1]+j,j);
      if f[i]>maxm then maxm:=f[i];
    end;
  writeln(maxm);
end.