program student;
var a:array[1..500000] of longint;
    n,m,i,j,k,total,up,down,last,now:longint;
    ch:char;
begin
    assign(input,'student.in'); reset(input);
    readln(n,k);
    fillchar(a,sizeof(a),0);
    total:=0; last:=0;
    for i:=1 to k do begin
        read(ch);
        if ch='A' then begin
            readln(now);
            for j:=now downto last+1 do total:=total+a[j];
            write(total);
            last:=now;
        end;
        if ch='B' then begin
            readln(m,up);
            a[m]:=a[m]+up;
            if m<=last then total:=total+up;
        end;
        if ch='C' then begin
            readln(m,down);
            a[m]:=a[m]-down;
            if m<=last then total:=total-down;
        end;
    end;
    close(input);
end.
