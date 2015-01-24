program ural1127;
const
  colors=10;
  num:array['A'..'Z']of byte=(1,2,3,0,0,0,4,0,0,0,0,0,0,0,5,0,0,6,7,0,0,8,9,0,10,0);
var
  count:array[1..colors,1..colors,1..colors,1..colors]of word;
  n,i:word;
  s:string[6];
  a,b,c,d:byte;
procedure add(a,b,c,d:byte);
  begin
    inc(count[num[s[a]],num[s[b]],num[s[c]],num[s[d]]]);
  end;
procedure process(a,b,c,d:byte);
  begin
    add(a,b,c,d);
    add(b,c,d,a);
    add(c,d,a,b);
    add(d,a,b,c);
    add(d,c,b,a);
    add(c,b,a,d);
    add(b,a,d,c);
    add(a,d,c,b);
  end;
begin
  readln(n);
  for i:=1 to n do begin
    readln(s);
    process(1,2,4,3);
    process(1,5,4,6);
    process(3,5,2,6);
  end;

  n:=0;
  for a:=1 to colors do
    for b:=1 to colors do
      for c:=1 to colors do
        for d:=1 to colors do
          if count[a,b,c,d]>n then n:=count[a,b,c,d];
  writeln(n);
end.
