program test;
const n=100;
      ch:array[1..3] of string=('MODIFY','MAX','MIN');
var i,j,k,s:longint;
begin
    randomize;
    assign(output,'intree.in'); rewrite(output);
    writeln(n,' ',n);
    for i:=1 to n do write(random(2*n)+1,' ');
    writeln;
    for i:=1 to n do begin
        k:=random(3)+1;
        write(ch[k],' ');
        if k=1 then writeln(random(n)+1,' ',random(2*n)+1)
         else begin
             s:=random(8*n div 10)+1;
             write(s,' ');
             j:=s-1;
             while j<=s do j:=random(n)+1;
             writeln(j);
         end;
    end;
    close(output);
end.