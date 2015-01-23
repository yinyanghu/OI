program p0039;
const max=2000000000;
var p,w:array[1..500] of word;
    f:array[0..10000] of longint;
    t,n,i,s,j,m,k:longint;

begin
    readln(t);
    for s:=1 to t do begin
        readln(k,m);
        readln(n);
        m:=m-k;
        for i:=1 to n do read(p[i],w[i]);
        f[0]:=0;
        for i:=1 to m do begin
            f[i]:=max;
            for j:=1 to n do
              if i>=w[j] then begin
                  k:=f[i-w[j]]+p[j];
                  if k<f[i] then f[i]:=k;
              end;
        end;
        if f[m]=max then writeln('This is impossible.')
           else writeln('The minimum amount of money in the piggy-bank is ',f[m],'.');
    end;
end.
