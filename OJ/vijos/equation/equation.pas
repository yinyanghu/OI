program equation;
const k=1e-11;
var a,b,x,s1,s2:extended;
    p,m,n:integer;
function f(x:extended; m,n,p:integer):extended;
 var w1,w2,w3:extended;
     i:integer;
 begin
     {w1:=1; w2:=1; w3:=1;
     for i:=1 to trunc(x) do begin
         w1:=w1*m;
         w2:=w2*n;
         w3:=w3*p;
     end;
     f:=w1+w2-w3;}
     f:=exp(x*ln(m))+exp(x*ln(n))-exp(x*ln(p));
 end;

begin
    assign(input,'equation.in'); reset(input);
    assign(output,'equation.out'); rewrite(output);
    readln(m,n,p,a,b);
    close(input);
    if f(a,m,n,p)*f(b,m,n,p)>0 then begin
        writeln('NO');
        close(output);
        halt;
    end;
    repeat
       x:=(a+b)/2;
       s1:=f(a,m,n,p);
       s2:=f(x,m,n,p);
       if s1*s2<0 then b:=x else a:=x;
    until (abs(b-a)<k);
    writeln((a+b)/2);
    writeln(f((a+b)/2,m,n,p));
    close(output);
end.