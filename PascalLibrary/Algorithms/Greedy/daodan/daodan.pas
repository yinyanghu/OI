program daodan;
var i,j,p,n,total,max:integer;
    a,l,s:array[1..1000] of integer;
begin
    assign(input,'daodan.in'); reset(input);
    n:=0;
    while not eof do begin
        inc(n);
        read(a[n]);
    end;
    close(input);
    fillchar(l,sizeof(l),0);
    total:=1; l[1]:=a[1];
    for i:=2 to n do begin
        p:=0;
        for j:=1 to total do
           if (l[j]>=a[i]) and ((p=0) or (l[j]<l[p])) then p:=j;
        if (p=0) then begin
            inc(total);
            l[total]:=a[i];
        end else l[p]:=a[i];
    end;

    fillchar(s,sizeof(s),0);
    for i:=n downto 1 do begin
        max:=1;
        for j:=n downto i+1 do begin
           if (a[i]>a[j]) then
             if (max<s[j]+1) then max:=s[j]+1;
        end;
        s[i]:=max;
    end;
    max:=0;
    for i:=1 to n do if s[i]>max then max:=s[i];

    assign(output,'daodan.out'); rewrite(output);
    writeln(max);
    writeln(total);
    close(output);
end.
