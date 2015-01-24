program test;
const n=100;
var i,j,k,m:longint;
begin
    randomize;
    assign(output,'bitree.in'); rewrite(output);
    writeln(n);
    for i:=1 to n do write(random(20000)+1,' ');
    writeln;
    writeln(n);
    for i:=1 to n do begin
        m:=random(2);
        if m=0 then begin
            write('MODIFY ');
            writeln(random(n)+1,' ',random(20000)+1);
        end;
        if m=1 then begin
            write('SUM ');
            j:=random(n div 10*8)+1;
            k:=random(n)+1;
            while k<=j do k:=random(n)+1;
            writeln(j,' ',k);
        end;
    end;
    close(output);
end.
