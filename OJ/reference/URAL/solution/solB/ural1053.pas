var
        ans,n   :       longint;
function gcd(a,b:longint):longint;
var
        i     :       longint;
begin
  while b<>0 do
    begin
      i:=a mod b;
      a:=b;
      b:=i;
    end;
  exit(a);
end;

var
        i,j   :       longint;
begin
  readln(n);
  read(ans);
  for i:=1 to n-1 do
    begin
      read(j);
      ans:=gcd(ans,j);
    end;
  writeln(ans);
end.