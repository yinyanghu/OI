{It's easy to prove that any line connecting two non-adjacent points
 does not have the largest inclination. So just check the adjacent points}
program ural1010;
var
  n,i,p:longint;
  a,b,max:double;
begin
  readln(n,b);
  max:=0;p:=2;
  for i:=2 to n do begin
    a:=b;readln(b);
    if abs(a-b)>max then begin
      max:=abs(a-b);
      p:=i;
    end;
  end;
  writeln(p-1,' ',p);
end.
