program ural1042;
const
  maxn=250;
var
  e:array[1..maxn,0..maxn]of boolean;
  n,i,j:integer;
  first:boolean;
procedure fail;
  begin
    writeln('No solution');
    halt;
  end;
procedure testfail;
  var
    j,k:integer;
    ok:boolean;
  begin
    for j:=1 to i do begin
      if e[j,0]=false then continue;
      ok:=false;
      for k:=1 to i do
        if e[j,k]=true then begin
          ok:=true;
          break;
        end;
      if not ok then fail;
    end;
  end;
procedure findtrue;
  var
    j,k:integer;
    b:boolean;
  begin
    for j:=i downto 1 do
      if e[j,i]=true then begin
        if j<i then
          for k:=0 to i do begin
            b:=e[j,k];e[j,k]:=e[i,k];e[i,k]:=b;
          end;
        exit;
      end;
  end;
procedure reduce;
  var
    j,k:integer;
  begin
    for j:=1 to i-1 do
      if e[j,i] then
        for k:=0 to n do
          e[j,k]:=e[j,k] xor e[i,k];
  end;
begin
  read(n);
  for i:=1 to n do begin
    e[i,0]:=true;
    repeat
      read(j);
      if j>0 then e[j,i]:=true;
    until j<0;
  end;

  for i:=n downto 1 do begin
    testfail;
    findtrue;
    if e[i,i] then reduce;
  end;

  for i:=1 to n do begin
    for j:=1 to i-1 do
      if e[i,j] then e[i,0]:=e[i,0] xor e[j,0];
    if e[i,0] and not e[i,i] then fail;
  end;

  first:=true;
  for i:=1 to n do
    if e[i,0] then begin
      if first then first:=false else write(' ');
      write(i);
    end;
  writeln;
end.
