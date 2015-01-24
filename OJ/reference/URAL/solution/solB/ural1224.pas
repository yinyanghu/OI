var
        i,j     :       cardinal;
begin
  readln(i,j);
  i:=i shl 1-2;
  j:=j shl 1-1;
  if i<j then writeln(i)
         else writeln(j);
end.