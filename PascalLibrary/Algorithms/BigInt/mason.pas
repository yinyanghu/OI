program mason;
const max=500;
      x=27;
var a:array[1..max] of integer;
    i,j,k,s,p,t,m:longint;
begin
    readln(p);
    writeln(trunc((p*ln(2))/ln(10)+1));
    fillchar(a,sizeof(a),0);
    a[1]:=1; m:=1;
    for i:=1 to x do m:=m*2;
    t:=p mod x;
    p:=p div x;
    for i:=1 to p do begin
        k:=0;
        for j:=1 to max do begin
            s:=a[j]*m+k;
            k:=s div 10;
            a[j]:=s mod 10;
        end;
    end;
    for i:=1 to t do begin
        k:=0;
        for j:=1 to max do begin
            s:=a[j]*2+k;
            k:=s div 10;
            a[j]:=s mod 10;
        end;
    end;
    dec(a[1]);
    for i:=max downto 1 do begin
        write(a[i]);
        if ((i-1) mod 50=0) then writeln;
    end;
end.