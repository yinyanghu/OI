program question19;
var i,p,m,n:longint;
    a:array[1..100] of word;
begin
    readln(m,n);
    fillchar(a,sizeof(a),0);
    p:=0;
    write(m);
    while m<>0 do begin
        inc(p);
        a[p]:=m mod n;
        m:=m div n;
    end;
    write('=(');
    for i:=p downto 1 do
      if a[i]>9 then write(chr(a[i]+55)) else write(a[i]);
    write(')',n);
    readln;
end.