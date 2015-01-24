program charusort;
var i,j,n:integer;
    a:array[1..10000] of integer;
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);{0..100}
 {**************************************************}
    for i:=2 to n do begin
        a[0]:=a[i];
        j:=i-1;
        while (a[0]<a[j]) and (j>0) do begin  {cha ru pai xu}
            a[j+1]:=a[j];
            dec(j);
        end;
        a[j+1]:=a[0];
    end;
 {**************************************************}
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.