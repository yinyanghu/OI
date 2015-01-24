program ural1355;
var
  t,u,a,b,ans:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(a,b);
    if b mod a>0 then begin writeln(0);continue;end;
    ans:=1;b:=b div a;
    while not odd(b) do begin inc(ans);b:=b shr 1;end;
    a:=3;
    while sqr(a)<=b do begin
      while b mod a=0 do begin inc(ans);b:=b div a;end;
      inc(a,2);
    end;
    if b>1 then inc(ans);
    writeln(ans);
  end;
end.
