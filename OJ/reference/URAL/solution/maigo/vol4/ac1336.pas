program ural1336;
var
  n,i:longint;
  m,k:qword;
  o:boolean;
begin
  read(n);
  m:=1;k:=1;
  for i:=2 to trunc(sqrt(n)+1e-9) do begin
    o:=false;
    while n mod i=0 do begin
      n:=n div i;
      o:=not o;
      if not o then m:=m*i;
    end;
    if o then begin
      m:=m*i*i;k:=k*i;
    end;
  end;
  if n<>1 then begin
    m:=m*n*n;k:=k*n;
  end;
  writeln(m);writeln(k);
end.
