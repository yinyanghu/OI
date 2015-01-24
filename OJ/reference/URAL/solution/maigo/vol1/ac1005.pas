program ural1005;
const
  maxn=20;
var
  w:array[1..maxn]of longint;
  n,i:byte;
  total,min,s:longint;
procedure search(l:byte);
  begin
    if l=n then begin
      if abs(total-s*2)<min then min:=abs(total-s*2)
    end
    else begin
      search(l+1);
      inc(s,w[l]);
      search(l+1);
      dec(s,w[l]);
    end;
  end;
begin
  read(n);
  total:=0;
  for i:=1 to n do begin
    read(w[i]);
    inc(total,w[i]);
  end;

  min:=total;s:=0;
  search(1);

  writeln(min);
end.
