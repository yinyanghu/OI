program fact;
var total,p,k,i,n,a,b:longint;
begin
    assign(input,'fact.in'); reset(input);
    assign(output,'fact.out'); rewrite(output);
    readln(n);
    a:=0; b:=0;
    p:=2; k:=1;
    while k>0 do begin
        k:=n div p;
        a:=a+k;
        p:=p*2;
    end;
    p:=5; k:=1;
    while k>0 do begin
        k:=n div p;
        b:=b+k;
        p:=p*5;
    end;
    if b>a then begin
        writeln('5');
        close(input);
        close(output);
        halt;
    end;
    total:=1;
    for i:=2 to n do begin
        p:=i;
        while (p mod 5=0) do p:=p div 5;
        while (b>0) and (p mod 2=0) do begin
            p:=p div 2;
            dec(b);
        end;
        total:=total*p mod 10;
    end;
    writeln(total);
    close(input);
    close(output);
end.
