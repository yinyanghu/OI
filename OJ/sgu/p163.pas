program p163;
var n,k,i,j,m,total,p,sum:longint;
begin
    readln(n);
    readln(k);
    total:=0;
    if odd(k) then begin
       for i:=1 to n do begin
           read(m);
           if m>0 then begin
               sum:=1;
               for j:=1 to k do sum:=sum*m;
               total:=total+sum;
           end;
       end;
    end else begin
        for i:=1 to n do begin
            read(m);
            sum:=1;
            for j:=1 to k do sum:=sum*m;
            total:=total+sum;
        end;
    end;
    writeln(total);
end.