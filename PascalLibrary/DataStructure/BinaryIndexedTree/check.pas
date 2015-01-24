program check;
const maxn=100000;
var a:array[1..maxn] of longint;
    i,j,k,m,n,p,s:longint;
    step:char;
begin
    assign(input,'bitree.in'); reset(input);
    assign(output,'test.out'); rewrite(output);
    readln(n);
    for i:=1 to n do read(a[i]);
    readln(m);
    for i:=1 to m do begin
        read(step);
        if step='M' then begin
           while step<>' ' do read(step);
           readln(p,s);
           a[p]:=s;
        end else begin
            while step<>' ' do read(step);
            readln(p,s);
            k:=0;
            for j:=p to s do k:=k+a[j];
            writeln(k);
        end;
    end;
    close(input);
    close(output);
end.