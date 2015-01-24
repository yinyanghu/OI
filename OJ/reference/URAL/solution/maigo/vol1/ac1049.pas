program ural1049;
const
  max=10000;
var
  count:array[2..max]of byte;
  i,j,ans:byte;
  a:integer;
begin
  fillchar(count,sizeof(count),0);
  for i:=1 to 10 do begin
    read(a);
    for j:=2 to trunc(sqrt(a)) do begin
      if a=1 then break;
      while a mod j=0 do begin
        inc(count[j]);
        a:=a div j;
      end;
    end;
    if a>1 then inc(count[a]);
  end;

  ans:=1;
  for a:=2 to max do begin
    ans:=ans*(count[a]+1) mod 10;
    if ans=0 then break;
  end;
  writeln(ans);
end.
