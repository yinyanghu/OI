program ural1169;
const
  maxn=100;
  maxk=maxn*(maxn-1) div 2;
var
  sol:array[0..maxk,0..maxn div 3]of shortint;
  n:byte;
  k,d,i,j:integer;
begin
  read(n,k);
  k:=n*(n-1) div 2-k;
  sol[0,0]:=0;for i:=1 to k do sol[i,0]:=-1;

  for i:=n downto 3 do begin
    if sol[k,0]>=0 then break;
    d:=i*(i-1) div 2;
    for j:=0 to k-d do begin
      if sol[j,0]=-1 then continue;
      if sol[j,sol[j,0]]+i>n then continue;
      if (sol[j+d,0]=-1) or (sol[j,sol[j,0]]+i<sol[j+d,sol[j+d,0]]) then begin
        sol[j+d]:=sol[j];
        inc(sol[j+d,0]);sol[j+d,sol[j+d,0]]:=sol[j,sol[j,0]]+i;
        if j+d=k then break;
      end;
    end;
  end;

  if sol[k,0]=-1 then
    writeln(-1)
  else begin
    for i:=2 to n do
      writeln(i-1,' ',i);
    n:=sol[k,0];sol[k,0]:=0;
    for i:=1 to n do
      writeln(sol[k,i-1]+1,' ',sol[k,i]);
  end;
end.
