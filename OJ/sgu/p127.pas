program p127;
var k,n,i,p,total:longint;
    ok:array[0..9] of longint;
    a:array[1..8000] of longint;
begin
    readln(k);
    readln(n);
    for i:=1 to n do readln(a[i]);
    total:=0;
    for i:=1 to n do begin
        p:=a[i] div 1000;
        inc(ok[p]);
    end;
    for i:=0 to 9 do
      if (i<>0) and (i<>8) then begin
          if ok[i] mod k<>0 then ok[i]:=ok[i]+k;
          total:=total+ok[i] div k;
      end;
    writeln(total+2);
end.
