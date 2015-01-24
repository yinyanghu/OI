//Written on 6148 -- Feb 24, 2005
program binstirl;
var
  t,u,n,m,k:cardinal;
procedure doit;
  begin
    read(n,m);k:=4;
    while (k<n) or ((k+m) shr 1<n) do k:=k shl 1;
    while k>4 do begin
      k:=k shr 1;
      if m>k then begin
        dec(n,k);dec(m,k);
      end
      else if n>=m+k shr 1 then
        dec(n,k shr 1)
      else if n>(k+m) shr 1 then begin
        writeln(0);exit;
      end;
    end;
    writeln(1);
  end;
begin
  read(t);
  for u:=1 to t do
    doit;
end.
