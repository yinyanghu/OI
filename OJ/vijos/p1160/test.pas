program test;
const n=300000;
var i,k,p:longint;
begin
    assign(output,'test.in'); rewrite(output);
    writeln(n); randomize;
    for i:=1 to n div 25 do begin
        k:=random(3*n)+1;
        writeln('1 ',k);
    end;
    for i:=n div 25+1 to n do begin
	k:=random(3*n)+1;
        p:=random(n)+1;
        writeln(p,' ',k);
    end;
    close(output);
end.