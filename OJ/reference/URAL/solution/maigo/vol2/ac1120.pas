program ural1120;
const
  zero=1e-6;
var
  n,p:longint;
begin
  readln(n);
  for p:=trunc(sqrt(2*n)) downto 1 do
    if (n-p*(p-1) div 2) mod p=0 then begin
      writeln((n-p*(p-1) div 2) div p,' ',p);
      halt;
    end;
end.

