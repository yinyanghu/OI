program p181;
var s,a,b,c,m,k:longint;
    x:array[0..1001] of longint;
    i,j,cycle,l:longint;
    ok:boolean;
begin
    read(s,a,b,c,m,k);
    if (m=1) and (k<>0) then begin
        writeln('0');
        halt;
    end;
    if k=0 then begin
        writeln(s);
        halt;
    end;
    x[0]:=s; ok:=true;
    cycle:=0; l:=m+1;
    for i:=1 to m+1 do begin
        if i>k then break;
        if not ok then break;
        x[i]:=(a*(x[i-1] mod m)*(x[i-1] mod m)+b*(x[i-1] mod m)+c) mod m;
        for j:=0 to i-1 do
          if x[i]=x[j] then begin
              cycle:=j;
              l:=i-j;
              ok:=false;
              break;
          end;
    end;
    k:=k-cycle;
    writeln(x[(k mod l)+cycle]);
end.