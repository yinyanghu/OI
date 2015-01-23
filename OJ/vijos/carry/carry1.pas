program carry;
var a:array[1..1000] of integer;
    i,j,n,k:integer;
    total:longint;
begin
    assign(input,'carry10.in'); reset(input);
    assign(output,'carry.out'); rewrite(output);
    readln(n);
    for i:=1 to n do read(a[i]);
    total:=0;
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if a[i]>a[j] then begin
            inc(total);
            k:=a[i]; a[i]:=a[j]; a[j]:=k;
        end;
    writeln(total);
    close(input);
    close(output);
end.