program ural1087;
const
  maxn=10000;
  maxm=50;
var
  k:array[1..maxm]of word;
  win:array[0..maxn]of boolean;
  n,i:word;
  m,j:byte;
begin
  readln(n,m);
  for j:=1 to m do
    read(k[j]);

  win[0]:=true;
  for i:=1 to n do begin
    win[i]:=false;
    for j:=1 to m do
      if i>=k[j] then
        if not win[i-k[j]] then begin
          win[i]:=true;
          break;
        end;
  end;

  if win[n] then writeln(1) else writeln(2);
end.
