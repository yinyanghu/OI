program number;
var k,i,p,s1,s2,s3:longint;
begin
    assign(input,'number.in'); reset(input);
    assign(output,'number.out'); rewrite(output);
    readln(k);
    p:=0;
    for i:=10000 to 30000 do begin
        s1:=i div 100;
        s2:=(i-(i div 10000*10000)) div 10;
        s3:=i-(i div 1000*1000);
        if (s1 mod k=0) and (s2 mod k=0) and (s3 mod k=0) then begin
            inc(p);
            writeln(i);
        end;
    end;
    if p=0 then writeln('No');
    close(input);
    close(output);
end.
