program make;
const n=100000;
      limitsize=10000;
var i:longint;
begin
    assign(output,'lis.in'); rewrite(output);
    randomize;
    writeln(n);
    for i:=1 to n-1 do write(random(limitsize),' ');
    writeln(random(limitsize));
    close(output);
end.
