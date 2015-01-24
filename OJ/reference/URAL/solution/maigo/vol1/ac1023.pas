{We can prove that l=d-1, where d is the least divisor of k but larger than 2.
 Proof:
   1) Let l+1 be a divisor of k. At each step, if 1P takes n buttons, 2P can
      take (l+1-n) buttons, making the number of remaining buttons still a
      multiple of l+1. In the end 2P can take the last button.
   2) Let l+1 be not a divisor of k, and let r be k mod (l+1). Obviously r<>0.
      So at the first step 1P can take r buttons, confronting 2P with the
      situation stated in case 1). In the end 2P will lose.}
program ural1023;
var
  k,i:longint;
begin
  readln(k);
  for i:=3 to trunc(sqrt(k)) do
    if k mod i=0 then begin
      writeln(i-1);
      halt;
    end;
  if (k mod 2=0) and (k>5) then writeln(k div 2-1) else writeln(k-1);
end.
