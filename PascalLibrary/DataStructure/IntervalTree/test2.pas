program test;
const n=100;
      ch:array[1..2] of string=('DELETE','RMQ');
var i,j,k,s,total:longint;
begin
    randomize;
    assign(output,'intree1.in'); rewrite(output);
    writeln(n,' ',n);
    for i:=1 to n do write(random(2*n)+1,' ');
    writeln; total:=0;
    for i:=1 to n do begin
        k:=random(2)+1;
        write(ch[k],' ');
        if k=1 then begin
           s:=random(n)+1;
           while s>n-total do s:=random(n)+1;
           inc(total);
           writeln(s);
        end else begin
            s:=maxlongint;
            while s>(n-total) div 2 do s:=random(8*n div 10)+1;
            write(s,' ');
            j:=s-1;
            while (j<=s) or (j>n-total) do j:=random(n)+1;
            writeln(j);
        end;
    end;
    close(output);
end.
