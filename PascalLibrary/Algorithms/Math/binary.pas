program binary;
const e=0.1;
var x,y,mid:double;
    s,t:longint;
function f(x:double):double;
 begin
     f:=x*x*x*x*x-x*x*x-5*x*x+4;
 end;

begin
    readln(s,t);
    x:=s; y:=t;
    if f(x)*f(y)>0 then begin
        writeln('Error!');
        halt;
    end;
    writeln('[',x:0:5,',',y:0:5,']');
    while (y-x>=e) do begin
        mid:=(x+y)/2; write(mid:0:5,'  ',f(mid):0:5,'   ');
        if f(mid)=0 then halt;
        if f(x)*f(mid)<0 then begin
           y:=mid;
           writeln('[',x:0:5,',',y:0:5,']');
        end else begin
            x:=mid;
            writeln('[',x:0:5,',',y:0:5,']');
        end;
    end;
    writeln(y-x:0:5);
end.