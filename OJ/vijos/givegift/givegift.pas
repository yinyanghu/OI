program givegift;
var s:array[1..10] of longint;
    a:array[1..10] of string;
    i,j,k,m,n,total,man,sum:longint;
    p:string;
begin
    assign(input,'givegift.in'); reset(input);
    readln(n);
    for i:=1 to n do readln(a[i]);
    fillchar(s,sizeof(s),0);
    for i:=1 to n do begin
        readln(p);
        for k:=1 to n do
          if p=a[k] then break;
        readln(total,man);
        if man<>0 then begin
            s[k]:=s[k]-total+total mod man;
            sum:=total div man;
        end;
        for j:=1 to man do begin
            readln(p);
            for m:=1 to n do
              if p=a[m] then break;
            s[m]:=s[m]+sum;
        end;
    end;
    for i:=1 to n do writeln(a[i],' ',s[i]);
    close(input);
end.