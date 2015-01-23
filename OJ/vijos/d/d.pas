program d;
var x:array[0..1000] of longint;
    a:array[1..1000] of longint;
    i,j,k,n,m,s,p,remain:longint;

begin
    assign(input,'d.in'); reset(input);
    assign(output,'d.out'); rewrite(output);
    readln(p,n);
    for i:=0 to n do read(x[i]);
    fillchar(a,sizeof(a),0);
    for i:=1 to n+1 do begin
        k:=1;
        for j:=1 to i-1 do k:=k*2;
        a[i]:=a[i]+k;
    end;
    close(input);

    remain:=p;
    for i:=n+1 downto 1 do begin
        k:=0; s:=0;
        if (a[i]*x[i-1]>remain) then begin
            k:=a[i]*x[i-1];
            s:=x[i-1];
            while (k>remain) and (s>=0) do begin k:=k-a[i]; s:=s-1; end;
            remain:=remain-k;
            if (remain>=0) and (s<>0) then writeln(i-1,' ',s);
        end else if (a[i]*x[i-1]<=remain) then begin
            remain:=remain-a[i]*x[i-1];
            if (x[i-1]<>0) then writeln(i-1,' ',x[i-1]);
        end;
        if remain<=0 then begin
            close(output);
            halt;
        end;
    end;
    close(output);
end.
