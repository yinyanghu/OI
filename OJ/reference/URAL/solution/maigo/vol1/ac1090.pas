program ural1090;
const
  maxn=16383;
  root=8192;
var
  tree:array[1..maxn]of word;
  n,j,x:integer;
  k,i,ans:byte;
  jump,max:longint;
procedure ins(x:word);
  var
    p,d:word;
  begin
    p:=root;d:=root shr 1;
    while p<>x do begin
      inc(tree[p]);
      if p<x then
        inc(p,d)
      else begin
        inc(jump,tree[p]-tree[p-d]);
        dec(p,d);
      end;
      d:=d shr 1;
    end;
    inc(tree[p]);
    if d>0 then inc(jump,tree[p+d]);
  end;
begin
  read(n,k);

  max:=-1;
  for i:=1 to k do begin
    fillchar(tree,sizeof(tree),0);
    jump:=0;
    for j:=1 to n do begin
      read(x);
      ins(x);
    end;
    if jump>max then begin
      max:=jump;
      ans:=i;
    end;
  end;

  writeln(ans);
end.
