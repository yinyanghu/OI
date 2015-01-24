//Written on 6182 -- Mar 30, 2005
program sum1seq;
var
  t,u,n,s,i,x:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(n,s);
    if (odd(s)<>odd(n shr 1)) or (abs(s)>n*(n-1) shr 1) then begin
      writeln('No');
      continue;
    end;
    writeln(0);x:=0;
    for i:=n-1 downto 1 do begin
      if s+i>i*(i-1) shr 1 then begin
        inc(x);dec(s,i);
      end
      else begin
        dec(x);inc(s,i);
      end;
      writeln(x);
    end;
  end;
end.
