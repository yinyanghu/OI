program color;
const max=100;
var i,j,k,n:integer;
    t:boolean;
    r:array[1..max,1..max] of 0..1;
    s:array[1..max] of integer;
begin
    assign(input,'color.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
        for j:=1 to n do read(r[i,j]);
        readln;
    end;
    s[1]:=1;
    i:=2; j:=1;
    while i<=n do begin
        while (j<=4) and (i<=n) do begin
            t:=false;
            for k:=1 to i-1 do if (r[i,k]=1) and (s[k]=j) then begin
                t:=true;
                break;
            end;
            if t then inc(j) else begin
                s[i]:=j;
                inc(i);
                j:=1;
            end;
        end;
        if (j>4) then begin
            dec(i);
            if (i=0) then begin
                writeln('No answer!');
                halt;
            end;
            j:=s[i]+1;
        end;
    end;
    writeln('The result:');
    for i:=1 to n do writeln(i,'--->',s[i]);
    close(input);
end.