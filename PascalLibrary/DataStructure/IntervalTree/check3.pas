program check;
const maxn=50000;
var a:array[1..maxn] of longint;
    i,j,k,m,n,x,y:longint;
    step:char;
begin
    assign(input,'itree.in'); reset(input);
    assign(output,'test3.out'); rewrite(output);
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to m do begin
        read(step);
        if step='I' then begin
            while step<>' ' do read(step);
            readln(x,y);
            for j:=x to y do inc(a[j]);
        end;
        if step='D' then begin
            while step<>' ' do read(step);
            readln(x,y);
            for j:=x to y do dec(a[j]);
        end;
        if step='T' then begin
            k:=0; readln;
            for j:=1 to n do
              if a[j]>0 then inc(k);
            writeln(k);
        end;
    end;
    close(input);
    close(output);
end.