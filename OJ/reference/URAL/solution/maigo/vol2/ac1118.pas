program ural1118;
var
  i,j,n,t,a:longint;
  m:real;
function divsum(x:longint):longint;
  var
    s,i:longint;
  begin
    s:=1;
    for i:=2 to trunc(sqrt(x)) do
      if x mod i=0 then inc(s,i+x div i);
    if sqr(trunc(sqrt(x)))=x then
      dec(s,trunc(sqrt(x)));
    divsum:=s;
  end;
begin
  readln(i,j);
  if i=1 then
    writeln(1)
  else begin
    m:=maxlongint;
    for n:=j downto i do begin
      t:=divsum(n);
      if t=1 then begin
        writeln(n);
        halt;
      end;
      if t/n<m then begin
        m:=t/n;a:=n;
      end;
    end;
    writeln(a);
  end;
end.
