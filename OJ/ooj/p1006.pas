program p1006;
var i,k:longint;
function check(s:longint):longint;
 var i,j,p,t,n:longint;
 begin
     p:=1; t:=s;
     for i:=2 to trunc(sqrt(s))+1 do begin
         n:=0;
         while t mod i=0 do begin
             inc(n);
             t:=t div i;
         end;
         if n<>0 then p:=p*(n+1);
         if t<=1 then break;
     end;
     check:=p;
 end;

begin
    readln(k);
    if k=1 then begin
        writeln(1);
        halt;
    end;
    for i:=1 to 20000 do
      if check(i)=k then begin
          writeln(i);
          halt;
      end;
    writeln('NO SOLUTION');
end.