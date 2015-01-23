program superknight;
var m,n,k,i:longint;

function f(a,b:longint):longint;
 begin
     if a mod b=0 then f:=b
       else f:=f(b,a mod b);
 end;

begin
    readln(k);
    for i:=1 to k do begin
        readln(m,n);
        if odd(m+n) then begin
           if n=0 then write('y')
             else if f(m,n)=1 then write('y')
               else write('n');
        end else write('n');
    end;
end.
