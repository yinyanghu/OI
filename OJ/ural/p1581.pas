program p1581;
var a:array[1..1000] of longint;
    i,k,n:longint;
    ok:boolean;
begin
    readln(n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do read(a[i]);
    i:=1; ok:=true;
    while i<=n do begin
        k:=1;
        while a[i]=a[i+1] do begin
            inc(k); inc(i);
        end;
        if ok then begin
            write(k,' ',a[i]);
            ok:=false;
        end else write(' ',k,' ',a[i]);
        inc(i);
    end;
end.