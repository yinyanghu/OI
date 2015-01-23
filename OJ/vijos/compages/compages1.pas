program compages;
var
   n,m,i,j,k:longint;
   a:array[1..100] of longint;
   b:array[0..10000] of longint;
begin
    assign(input,'compages.in');reset(input);
    assign(output,'compages.out');rewrite(output);
    readln(n,m);
    b[0]:=1;
    for i:=1 to n do
      begin
          read(a[i]);
          for j:=m downto 0 do
            if (b[j]>0) and (j+a[i]<=m) then
              b[j+a[i]]:=b[j+a[i]]+b[j];
      end;
    writeln(b[m]);
    close(input);
    close(output);
end.