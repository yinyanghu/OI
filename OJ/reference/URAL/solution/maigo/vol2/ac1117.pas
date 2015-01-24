program ural1117;
var
  a,b,c,d,m,ans:int64;
begin
  readln(a,b);
  if a>b then begin c:=a;a:=b;b:=c;end;
  ans:=0;m:=4;
  repeat
    c:=a-a mod m;d:=b-b mod m;
    if (d=c) and (a mod m>0) then break;
    inc(ans,(d-c) div m*2);
    if a mod m=0 then inc(ans);
    if b mod m=0 then dec(ans);
    m:=m*2;
  until false;
  writeln(ans);
end.
