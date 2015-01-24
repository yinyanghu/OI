program ural1088;
var
  d,e,f,h,s,i:byte;
  dp,ep,m:longint;
function max(a,b:byte):byte;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  readln(d,e,f,dp,ep,h);
  s:=(f-d)+(f-e);
  m:=power(2,f-1);
  for i:=1 to f-max(d,e) do begin
    if (dp>m)<>(ep>m) then break;
    if dp>m then begin
      dec(dp,m);
      dec(ep,m);
    end;
    dec(s,2);
    m:=m div 2;
  end;
  if s<=h then writeln('YES') else writeln('NO');
end.
