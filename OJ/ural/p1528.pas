program p1528;
var f:array[1..10000] of int64;
    i,j,k,m,n,p:longint;
begin
    fillchar(f,sizeof(f),0);
    readln(n,p);
    while (n<>0) and (p<>0) do begin
        f[1]:=1;
        for i:=2 to n do begin
            f[i]:=(f[i-1]*i) mod p;
            if f[i]=0 then begin
                f[n]:=0;
                break;
            end;
        end;
        writeln(f[n] mod p);
        readln(n,p);
    end;
end.
