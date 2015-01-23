program beauty;
const n=100;
var a:array[1..n] of longint;
    total,i,k,max:longint;
begin
    assign(input,'beauty.in'); reset(input);
    assign(output,'beauty.out'); rewrite(output);
    for i:=1 to n do read(a[i]); readln(k);
    max:=0; total:=0;
    for i:=1 to n do begin
        if a[i]>max then max:=a[i];
        if (a[i] mod k=0) then inc(total);
    end;
    writeln(max);
    writeln(total);
    close(input);
    close(output);
end.