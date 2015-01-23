program password;
const f:array[1..8] of longint=(10,90,900,9000,90000,900000,9000000,90000000);
var s:ansistring;
    n,i,j,k,l,p,m:longint;
begin
    readln(n);
    if n<10 then begin
        writeln(n);
        halt;
    end;
    inc(n); k:=n;
    for i:=1 to 8 do begin
        if k-f[i]*i>=0 then begin
            p:=i;
            k:=k-f[i]*i;
        end else begin
            p:=i-1;
            break;
        end;
    end;
    m:=1;
    for i:=1 to p do m:=m*10;
    inc(p);
    for i:=m to m*10 do
      if k>p then k:=k-p else break;
    str(i,s);
    writeln(s[k]);
end.

    {p:=0;
    while n>0 do begin
        inc(p);
        n:=n-f[p];
    end;
    n:=n+f[p];
    m:=0; p:=p-1;
    while n>0 do begin
        n:=n-p;
        inc(m);
    end;
    k:=1;
    for i:=1 to p-1 do k:=k*10;
    k:=k+m-1;
    str(k,s);
    writeln(s[length(s)+n]);
end.

readln(n);
    k:=n; p:=0;
    while k>0 do begin
        inc(p);
        k:=k-f[p];
    end;
    p:=p-1;
    l:=f[p];  k:=1;  s:='';
    for i:=1 to p-1 do k:=k*10;
    while l<n do begin
        l:=l+p;
        str(k,t);
        k:=k+1;
        s:=s+t;
    end;
    writeln(s[n-f[p]]);
end.}
