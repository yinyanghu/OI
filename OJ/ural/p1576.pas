program p1576;
var i,k,m,n1,tt,n2,n3,t,c1,c2,bp,cp,up:longint;
    min,sec:longint;
    s:string;
begin
    readln(n1,c1);
    readln(n2,t,c2);
    readln(n3);
    readln(k);
    bp:=n1; cp:=n2; up:=n3;
    for i:=1 to k do begin
        readln(s);
        m:=pos(':',s);
        val(copy(s,1,m-1),min);
        val(copy(s,m+1,length(s)-m),sec);
        if ((sec>6) and (min=0)) or ((sec>0) and (min>=1)) then tt:=min+1 else tt:=min;

        bp:=bp+c1*tt;

        if (t-tt>=0) and (t<>0) then t:=t-tt
           else begin
               if t<>0 then begin
                  cp:=cp+c2*(tt-t);
                  t:=0;
               end else cp:=cp+c2*tt;
           end;
    end;
    writeln('Basic:     ',bp);
    writeln('Combined:  ',cp);
    writeln('Unlimited: ',up);
end.