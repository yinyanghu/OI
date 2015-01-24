{This prog will fail when s reaches 60. Luckily, the limit is 50}
program ural1091;
var
  k,s,i:byte;
  ans:longint;
function prime(x:byte):boolean;
  var
    i:byte;
  begin
    for i:=2 to trunc(sqrt(x)) do
      if x mod i=0 then begin
        prime:=false;
        exit;
      end;
    prime:=true;
  end;
function primepro(x:byte):boolean;
  var
    i:byte;
  begin
    i:=2;
    while x mod i>0 do
      inc(i);
    if (i*i<x) and prime(x div i) then primepro:=true else primepro:=false;
  end;
function c(n,m:byte):longint;
  var
    i:byte;
  begin
    c:=1;
    for i:=1 to m do
      c:=c*(n+1-i) div i;
  end;
begin
  readln(k,s);
  ans:=0;
  for i:=2 to s div k do
    if prime(i) then
      inc(ans,c(s div i,k))
    else
      if primepro(i) then
        dec(ans,c(s div i,k));
  if ans>10000 then writeln(10000) else writeln(ans);
end.
