program monkeyking;
var i,j,k,s,n:integer;
    a:array[1..1000] of boolean;
begin
    write('Enter monkey number=');
    readln(n);
    s:=n;
    fillchar(a,sizeof(a),true);
    i:=0;
    while s>1 do begin
        j:=0;
        while j<3 do begin
            i:=i mod n+1;
            if a[i] then inc(j);
        end;
        a[i]:=false;
        dec(s);
    end;
    for i:=1 to n do if a[i] then writeln('King is ',i);
    readln;
end.