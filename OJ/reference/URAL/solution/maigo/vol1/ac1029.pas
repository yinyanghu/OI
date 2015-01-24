program ural1029;
const
  maxm=100;
  maxn=500;
var
  fee,sum,old,min:array[1..maxn]of longint;
  path:array[2..maxm,1..maxn]of integer;
  m,f:byte;
  n,i,j,finish:integer;
  best:longint;
procedure outpath(f:byte;p:integer);
  var
    i:integer;
  begin
    if f=1 then
      writeln(p)
    else begin
      outpath(f-1,path[f,p]);
      if path[f,p]<p then
        for i:=path[f,p] to p do
          writeln(i)
      else
        for i:=path[f,p] downto p do
          writeln(i);
    end;
  end;
begin
  readln(m,n);
  for i:=1 to n do
    read(min[i]);

  for f:=2 to m do begin
    old:=min;
    for i:=1 to n do begin
      read(fee[i]);
      min[i]:=maxlongint;
    end;
    sum[1]:=fee[i];
    for i:=2 to n do
      sum[i]:=sum[i-1]+fee[i];

    for i:=1 to n do begin
      for j:=i to n do begin
        if old[j]+sum[j]<min[i] then begin
          min[i]:=old[j]+sum[j];
          path[f,i]:=j;
        end;
        if old[i]+sum[j]<min[j] then begin
          min[j]:=old[i]+sum[j];
          path[f,j]:=i;
        end;
      end;
      for j:=i+1 to n do
        dec(sum[j],fee[i]);
    end;
  end;

  best:=maxlongint;
  for i:=1 to n do
    if min[i]<best then begin
      best:=min[i];
      finish:=i;
    end;

  outpath(m,finish);
end.
