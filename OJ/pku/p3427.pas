program p3427;
var n,l,k,i,min:longint;
begin
    min:=0;
    readln(n,l);
    for i:=1 to n do begin
        read(k);
        k:=k mod l;
        if (k<>0) and (min<l-k) then min:=l-k;
    end;
    writeln(min);
end.