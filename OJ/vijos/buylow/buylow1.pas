program buylow;
var a,b,c:array[1..5001] of longint;
    flag:array[1..30000] of boolean;
    i,j,k,n:longint;
    ml,max:longint;
begin
    assign(input,'buylow.in');
    assign(output,'buylow.out');
    reset(input);
    rewrite(output);
    readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do b[i]:=1;
    c[1]:=1;
    for i:=2 to n do begin
        ml:=1;
        for j:=1 to i-1 do if a[j]>a[i] then
            if b[j]+1>ml then ml:=b[j]+1;
        b[i]:=ml;
        fillchar(flag,sizeof(flag),false);
        if ml=1 then c[i]:=1 else
        for j:=i-1 downto 1 do begin
            if (a[j]>a[i]) and (b[j]+1=ml) then begin
               if not flag[a[j]] then c[i]:=c[i]+c[j];
               flag[a[j]]:=true;
            end;
        end;
    end;
    for i:=1 to n do if b[i]>ml then ml:=b[i];
    fillchar(flag,sizeof(flag),false);
    for i:=n downto 1 do if (b[i]=ml) then begin
        if not flag[a[i]] then max:=max+c[i];
        flag[a[i]]:=true;
    end;
    writeln(ml,' ',max);
    close(input);close(output);
end.