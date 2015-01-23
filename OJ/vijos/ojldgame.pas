program ojldgame;
var k,n,m,i,p:longint;

function check(a,b:longint):boolean;
 begin
     if (a=b) or (a div b>=2) then check:=true
       else check:=not check(b,a-b);
 end;

begin
    readln(k);
    for i:=1 to k do begin
        readln(m,n);
        if m<n then begin
            p:=m; m:=n; n:=p;
        end;
        if check(m,n) then writeln('Stan wins')
          else writeln('Ollie wins');
    end;
end.
