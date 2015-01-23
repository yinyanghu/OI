program loan;
const s=0.000000001;
var total,p,t,i:longint;
    rate,l,r,k:real;
begin
     assign(input,'loan.in'); reset(input);
     assign(output,'loan.out'); rewrite(output);
     readln(total,p,t);
     l:=0; r:=1;
     while r-l>s do begin
          rate:=(l+r)/2;
          k:=total;
          for i:=1 to t do k:=k*(rate+1)-p;
          if k<0 then l:=rate
          else r:=rate;
     end;
     writeln(rate*100:0:1);
     close(input);
     close(output);
end.
