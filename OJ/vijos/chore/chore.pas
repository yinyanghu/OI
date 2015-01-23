program chore;
const maxn=10000;
var a:array[1..maxn] of longint;
    n,total,i,num,k,max,time:longint;
begin
    assign(input,'chore.in'); reset(input);
    assign(output,'chore.out'); rewrite(output);
    readln(n);
    fillchar(a,sizeof(a),0);
    total:=0;
    for i:=1 to n do begin
        read(num); read(time);
        max:=0;
        read(k);
        while k<>0 do begin
            if a[k]>max then max:=a[k];
            read(k);
        end;
        a[i]:=max+time;
        if a[i]>total then total:=a[i];
    end;
    writeln(total);
    close(input);
    close(output);
end.