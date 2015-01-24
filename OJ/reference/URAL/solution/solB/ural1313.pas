var
        f       :       array[1..100,1..100] of longint;
        i,j,k,n :       longint;
begin
//  assign(input,'d.in');reset(input);
  readln(n);
  for i:=1 to n do
    for j:=1 to n do read(f[i,j]);
  for i:=1 to n do
    for j:=1 to i do
      write(f[i-j+1,j],' ');
  for i:=n-1 downto 1 do
    for j:=1 to i do
      write(f[n-j+1,n-i+j],' ');


end.