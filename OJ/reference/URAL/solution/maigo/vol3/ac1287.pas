program ural1287;
const
  maxn=1400;
var
  l:array[boolean,0..maxn+1]of char;
  m:array[1..4,boolean,0..maxn+1]of word;
  n,i,j,big,small:word;
  c:char;
procedure update(var x:word);
  var
    d:byte;
  begin
    for d:=1 to 4 do
      if m[d,odd(i),j]>x then x:=m[d,odd(i),j];
  end;
begin
  readln(n);
  for i:=1 to n do begin
    for j:=1 to n do begin
      read(c);l[odd(i),j]:=c;
      if c=l[odd(i),j-1] then m[1,odd(i),j]:=m[1,odd(i),j-1]+1 else m[1,odd(i),j]:=1;
      if c=l[not odd(i),j-1] then m[2,odd(i),j]:=m[2,not odd(i),j-1]+1 else m[2,odd(i),j]:=1;
      if c=l[not odd(i),j] then m[3,odd(i),j]:=m[3,not odd(i),j]+1 else m[3,odd(i),j]:=1;
      if c=l[not odd(i),j+1] then m[4,odd(i),j]:=m[4,not odd(i),j+1]+1 else m[4,odd(i),j]:=1;
      if l[odd(i),j]='S' then update(big) else update(small);
    end;
    readln;
  end;

  if big>small then begin
    writeln('S');
    writeln(big);
  end
  else begin
    if big=small then writeln('?') else writeln('s');
    writeln(small);
  end;
end.
