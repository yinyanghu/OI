program test;
const n=100000;
      m=1000;
      size=1000;
var i,k,x,y:longint;
begin
    assign(output,'interval.in'); rewrite(output);
    writeln(n,' ',m);
    randomize;
    for i:=1 to n-1 do write(random(size),' ');
    writeln(random(size));
    for i:=1 to m do begin
        k:=random(2)+1;
        write(k,' ');
        if k=1 then begin
           x:=random(n shr 1)+1;
           y:=random(n)+1;
           while y<x do y:=random(n)+1;
           writeln(x,' ',y,' ',random(size));
        end else begin
            x:=random(n shr 1)+1;
            y:=random(n)+1;
            while y<x do y:=random(n)+1;
            writeln(x,' ',y);
        end;
    end;
    close(output);
end.