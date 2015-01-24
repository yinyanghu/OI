program zhijiexuanzesort;
var i,j,n,k,m:integer;
    a:array[1..1000] of integer;
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);{0..100}
 {**************************************************}
    for i:=1 to n do begin
        k:=i;
        for j:=i+1 to n do if a[j]<a[k] then k:=j;
        if i<>k then begin                         {zhi jie xuan ze pai xu}
            m:=a[k];
            a[k]:=a[i];
            a[i]:=m;
        end;
    end;
 {**************************************************}
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.