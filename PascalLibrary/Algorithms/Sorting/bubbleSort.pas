program maopaosort;
var i,j,n,p:integer;
    a:array[1..10000] of integer;
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);{0..100}
 {**************************************************}
    for i:=1 to n-1 do
     for j:=1+i to n do                 {mao pao pai xu}
       if a[i]>a[j] then begin
           p:=a[i]; a[i]:=a[j]; a[j]:=p;
       end;
 {**************************************************}
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.
