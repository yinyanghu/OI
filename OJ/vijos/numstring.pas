program numstring;
var n,k:longint;

function f(n:longint):longint;
  begin
      if n=0 then f:=0 else f:=n xor f(n div 2);
  end;

begin
    readln(n);
    k:=f(n);
    writeln(k+1);
end.
