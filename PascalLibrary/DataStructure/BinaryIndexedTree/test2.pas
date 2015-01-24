program test;
const n=100;
var i,j,m:longint;
begin
    assign(output,'bitree2.in'); rewrite(output);
    writeln(n);
    randomize;
    for i:=1 to n do begin
        for j:=1 to n do write(random(2*n)+1,' ');
        writeln;
    end;
    writeln(n);
    for i:=1 to n do begin
        m:=random(2);
        if m=0 then begin
            write('MODIFY ');
            writeln(random(n)+1,' ',random(n)+1,' ',random(2*n)+1);
        end;
        if m=1 then begin
            write('SUM ');
            for j:=1 to 3 do write(random(n)+1,' ');
            writeln(random(n)+1);
        end;
    end;
    close(output);
end.