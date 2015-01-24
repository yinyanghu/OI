const max=10000;
var n,i,j,k,p:longint;
    s:array[1..max] of longint;
begin
    writeln('input n=');
    readln(n);
    fillchar(s,sizeof(s),0);
    s[1]:=1;
    p:=1;
    for i:=2 to n do begin
        k:=0;
        for j:=1 to p do begin
            s[j]:=s[j]*i+k;
            k:=s[j] div 10;
            s[j]:=s[j] mod 10;
        end;
        while (k<>0) do begin
            p:=p+1;
            s[p]:=k mod 10;
            k:=k div 10;
        end;
        if (p>max) then begin
           writeln('error');
           readln;
           halt;
        end;
    end;
    write(n,'!=');
    for i:=p downto 1 do write(s[i]);
    readln;
end.