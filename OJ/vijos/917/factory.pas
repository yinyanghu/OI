program factory;
var now:longint;
    s,p:string;
    i,j,k,l,m,n:longint;
begin
    assign(input,'factory.in'); reset(input);
    assign(output,'factory.out'); rewrite(output);
    readln(n);
    for i:=1 to n do begin
        readln(s);
        readln(p);
        now:=0;
        for j:=1 to length(p) do now:=now+(ord(p[j])-48);
        if now mod 3=0 then writeln(s);
    end;
    close(input);
    close(output);
end.