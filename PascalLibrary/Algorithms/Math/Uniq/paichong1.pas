program paichong;
var a:array[1..1000] of integer;
    i,j,m,n:integer;
    k:boolean;
begin
    writeln('Enter N=');
    readln(n);
    while i<n do begin
        a[i]:=random(100)+1;
        k:=false;
        for j:=1 to i-1 do if (a[i]=a[j]) then begin
            k:=true;
            break;
        end;
        if not k then inc(i);
    end;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.

