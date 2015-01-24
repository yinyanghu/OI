program ural1218;
const
  maxn=500;
var
  name:array[1..maxn]of string[30];
  o,p,q:array[1..maxn]of longint;
  go:array[1..maxn,1..maxn]of boolean;
  n,i,j,k:word;
  c:char;
  win:boolean;
begin
  readln(n);
  for i:=1 to n do begin
    repeat
      read(c);
      if c=' ' then break;
      name[i]:=name[i]+c;
    until false;
    readln(o[i],p[i],q[i]);
  end;

  for i:=1 to n do
    for j:=1 to n do
      go[i,j]:=ord(o[i]>=o[j])+ord(p[i]>=p[j])+ord(q[i]>=q[j])>1;

  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        go[i,j]:=go[i,j] or go[i,k] and go[k,j];

  for i:=1 to n do begin
    win:=true;
    for j:=1 to n do
      if not go[i,j] then begin
        win:=false;
        break;
      end;
    if win then writeln(name[i]);
  end;
end.
