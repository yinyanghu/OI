//Written on 6117 -- Jan 24, 2005
//It doesn't get source limit exceeded even if I write the prog as follows :)
//When submitting, I deleted all the all the spaces that can be deleted and
//  all the carriage returns, resulting in a code 150 bytes long.
program kamil;
var
  s:string;
  t,i,a:longint;
begin
  for t:=1 to 10 do begin
    readln(s);a:=1;
    for i:=1 to length(s) do if pos(s[i],'TDLF')>0 then a:=a*2;
    writeln(a);
  end;
end.
