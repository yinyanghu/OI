program check;
const maxn=100000;
var a:array[1..maxn] of longint;
    n,m,i,j,x,y,k,delta,sum:longint;
begin
    assign(input,'interval.in'); reset(input);
    assign(output,'check.out'); rewrite(output);
    readln(n,m);
    for i:=1 to n do read(a[i]);
    for i:=1 to m do begin
        read(k);
        if k=1 then begin
           readln(x,y,delta);
           for j:=x to y do a[j]:=a[j]+delta;
        end else begin
            readln(x,y);
            sum:=0;
            for j:=x to y do sum:=sum+a[j];
            writeln(sum);
        end;
    end;
    close(input);
    close(output);
end.