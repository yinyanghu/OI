program ural1022;
const
  maxn=100;
var
  adj:array[1..maxn,1..maxn]of boolean;
  indeg:array[1..maxn]of byte;
  v:array[1..maxn]of boolean;
  n,i,x,c:byte;
begin
  fillchar(adj,sizeof(adj),0);
  fillchar(indeg,sizeof(indeg),0);
  readln(n);
  for i:=1 to n do
    repeat
      read(x);
      if x=0 then break;
      adj[i,x]:=true;
      inc(indeg[x]);
    until false;

  x:=0;c:=0;
  repeat
    inc(x);
    if x>n then x:=1;
    if v[x] or (indeg[x]>0) then continue;
    inc(c);
    write(x);
    if c<n then
      write(' ')
    else begin
      writeln;
      halt;
    end;
    v[x]:=true;
    for i:=1 to n do
      if adj[x,i] then
        dec(indeg[i]);
  until false;
end.
