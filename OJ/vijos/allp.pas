program allp;
var f:array[1..20] of int64;
    a:array[1..20] of longint;
    m,i,j,temp,k:longint;
    n:int64;
begin
    readln(m,n);
    for i:=1 to m do f[i]:=1;
    for i:=1 to m do a[i]:=i;
    for i:=1 to m-1 do
       for j:=2 to i do f[i]:=f[i]*j;
    for i:=m-1 downto 1 do begin
        temp:=(n-1) div f[i]+1;
        k:=1; j:=1;
        while k<=temp do
          if a[j]<>0 then begin
                inc(k);
                inc(j);
          end else inc(j);
        write(a[j-1],' ');
        a[j-1]:=0;
        n:=n-(temp-1)*f[i];
    end;
    k:=m;
    while a[k]=0 do dec(k);
    write(a[k]);
end.