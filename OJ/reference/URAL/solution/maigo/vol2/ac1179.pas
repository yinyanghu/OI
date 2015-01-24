program ural1179;
var
  a:array[2..36]of longint;
  b:array[2..36]of boolean;
  c:char;
  x,i:byte;
procedure start(x:byte);
  begin
    b[x]:=true;
  end;
procedure finish(x:byte);
  begin
    if b[x] then begin
      b[x]:=false;
      inc(a[x]);
    end;
  end;
begin
  repeat
    read(c);
    if (c>='0') and (c<='9') then begin
      x:=ord(c)-48;
      for i:=2 to 36 do
        if i>x then start(i) else finish(i);
    end
    else if (c>='A') and (c<='Z') then begin
      x:=ord(c)-55;
      for i:=2 to 36 do
        if i>x then start(i) else finish(i);
    end
    else
      for i:=2 to 36 do
        finish(i);
  until eof;

  for i:=2 to 36 do
    finish(i);

  x:=2;
  for i:=3 to 36 do
    if a[i]>a[x] then x:=i;
  writeln(x,' ',a[x]);
end.
