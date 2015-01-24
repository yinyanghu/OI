program paichong;
var a:array[1..1000] of integer;
    i,j,m,n:integer;
    k:boolean;
    b:set of 0..255;
begin
    writeln('Enter N=');
    readln(n);
    i:=1;
    b:=[];
    while i<=n do begin
        a[i]:=random(100)+1;
        if not (a[i] in b) then begin
            b:=b+[a[i]];
            inc(i);
        end;
    end;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.

