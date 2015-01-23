program monpass;
var a:array[1..2500] of string;
    f:array[1..3000] of longint;
    i,max,n,j:longint;
    s:string;
begin
    assign(input,'monpass.in'); reset(input);
    readln(n);
    for i:=1 to n do readln(a[i]);
    close(input);
    fillchar(f,sizeof(f),0);
    for i:=1 to n do begin
        max:=0;
        for j:=1 to i-1 do begin
            s:=copy(a[i],1,length(a[j]));
            if (s=a[j]) and (f[j]>max) then max:=f[j];
        end;
        f[i]:=max+1;
    end;
    max:=0;
    for i:=1 to n do if f[i]>max then max:=f[i];
    writeln(max);
end.
