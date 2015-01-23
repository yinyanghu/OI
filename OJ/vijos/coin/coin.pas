program coin;
var a:array[1..200] of 0..1;
    i,j,k,m,n:integer;
procedure change(k:integer);
 begin
     if a[k]=0 then a[k]:=1 else a[k]:=0;
 end;

begin
    assign(input,'coin.in'); reset(input);
    assign(output,'coin.out'); rewrite(output);
    readln(n);
    writeln(n);
    for i:=1 to n do a[i]:=0;
    for i:=1 to n do begin
        for j:=1 to n do begin
            if i<>j then change(j);
            write(a[j]);
        end;
        writeln;
    end;
    close(input);
    close(output);
end.
