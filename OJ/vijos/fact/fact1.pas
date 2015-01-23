program fact;
var total:longint;
    i,j,k,m,n,p,min,five,two:longint;
begin
    readln(n);
    total:=1; five:=0; two:=0;
    for i:=2 to n do begin
        p:=i;
        while (p mod 10=0) do p:=p div 10;
        if odd(p) then begin
           while (p mod 5=0) do begin
               p:=p div 5;
               five:=five+1;
           end;
           p:=p mod 10;
           if (p in [3,7,9]) then total:=total*p;
        end else begin
            while (p mod 2=0) and (five>0) do begin
                p:=p div 2;
                five:=five-1;
            end;
            total:=total*p;
        end;
        while (total mod 10=0) do total:=total div 10;
        total:=total mod 10;
    end;
    writeln(total);
    readln;
end.