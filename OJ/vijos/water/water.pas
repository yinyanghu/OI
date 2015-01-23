program water;
var i,j,n:integer;
    k:longint;
    total:real;
    a:array[1..10000,1..2] of longint;
begin
    assign(input,'water.in'); reset(input);
    assign(output,'water.out'); rewrite(output);
    readln(n);
    for i:=1 to n do begin
        read(a[i,1]);
        a[i,2]:=i;
    end;
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if a[i,1]>a[j,1] then begin
            k:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=k;
            k:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=k;
        end;
    total:=0;
    for i:=1 to n do total:=total+(n-i)*a[i,1];
    writeln(total/n:0:2);
    close(input);
    close(output);
end.