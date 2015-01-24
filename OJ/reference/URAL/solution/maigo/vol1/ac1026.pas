program ural1026;
const
  maxcode=5000;
var
  count:array[1..maxcode]of longint;
  n,i:longint;
  a:integer;
procedure answer(a:longint);
  var
    l,r,m:integer;
  begin
    repeat
      l:=1;r:=maxcode;
      m:=(l+r) div 2;
      if count[m]<a then
        l:=m+1
      else
        if count[m-1]<a then begin
          writeln(m);
          exit;
        end
        else
          r:=m-1;
    until false;
  end;
begin
  fillchar(count,sizeof(count),0);
  readln(n);
  for i:=1 to n do begin
    readln(a);
    inc(count[a]);
  end;
  readln;
  for i:=2 to maxcode do
    inc(count[i],count[i-1]);

  readln(n);
  for i:=1 to n do begin
    readln(a);
    answer(a);
  end;
end.
