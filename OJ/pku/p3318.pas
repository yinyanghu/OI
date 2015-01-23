program p3318;
var a,b,c:array[1..500,1..500] of longint;
    xb,x,xab,xc:array[1..500] of longint;
    i,j,n:longint;
    ok:boolean;
begin
    randomize;
    for i:=1 to 500 do x[i]:=random(100) mod 10+1;
    readln(n);
    for i:=1 to n do
      for j:=1 to n do read(a[i,j]);
    for i:=1 to n do
      for j:=1 to n do read(b[i,j]);
    for i:=1 to n do
      for j:=1 to n do read(c[i,j]);
    fillchar(xb,sizeof(xb),0);
    fillchar(xab,sizeof(xab),0);
    fillchar(xc,sizeof(xc),0);
    for i:=1 to n do
      for j:=1 to n do xb[i]:=xb[i]+b[i,j]*x[j];
    ok:=true;
    for i:=1 to n do begin
        for j:=1 to n do begin
  	    xc[i]:=xc[i]+c[i,j]*x[j];
            xab[i]:=xab[i]+a[i,j]*xb[j];
        end;
        if xab[i]<>xc[i] then begin
	    writeln('NO');
	    ok:=false;
	    break;
	end;
    end;
    if ok then writeln('YES');
end.