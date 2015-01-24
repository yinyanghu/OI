program ural1366;
const
  base=1000000;
  len=6;
var
  a:array[0..428]of longint;
  n,i,d:longint;
procedure mul(x:longint);
  var
    i:longint;
  begin
    for i:=0 to d do a[i]:=a[i]*x;
    for i:=0 to d do begin inc(a[i+1],a[i] div base);a[i]:=a[i] mod base;end;
    if a[d+1]>0 then inc(d);
  end;
procedure inc1;
  var
    i:longint;
  begin
    inc(a[0]);
    i:=0;while a[i]=base do begin a[i]:=0;inc(i);inc(a[i]);end;
    if i>d then d:=i;
  end;
procedure dec1;
  var
    i:longint;
  begin
    dec(a[0]);
    i:=0;while a[i]<0 do begin inc(a[i],base);inc(i);dec(a[i]);end;
    if a[d]=0 then dec(d);
  end;
procedure out;
  var
    i,j:longint;
    s:string;
  begin
    write(a[d]);
    for i:=d-1 downto 0 do begin
      str(a[i],s);
      for j:=length(s)+1 to len do write(0);write(s);
    end;
    writeln;
  end;
begin
  read(n);
  for i:=2 to n do begin
    mul(i);
    if odd(i) then dec1 else inc1;
  end;
  out;
end.
