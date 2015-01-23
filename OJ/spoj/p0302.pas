program p0302;
var n,k,m,t,i:longint;
    r:real;
begin
    readln(t);
    for i:=1 to t do begin
        readln(n);
        r:=(sqrt(1+8.0*n)-1)/2;
        if abs(frac(r))<1e-5 then k:=trunc(r)
          else k:=trunc(r)+1;
        m:=n-k*(k-1) div 2;
        write('TERM ',n,' IS ');
        if odd(k) then writeln(k+1-m,'/',m)
           else writeln(m,'/',k+1-m);
    end;
end.