program square;
var a,b:array[1..4,1..4] of boolean;
    i,j,k,m,n,p:integer;
    total,sum:longint;
    s:string;
begin
    fillchar(a,sizeof(a),false);
    for i:=1 to 4 do begin
        readln(s);
        for j:=1 to 4 do if s[j]='1' then a[i,j]:=true;
    end;
    readln;
    fillchar(b,sizeof(b),false);
    for i:=1 to 4 do begin
        readln(s);
        for j:=1 to 4 do if s[j]='1' then b[i,j]:=true;
    end;
    total:=0;
    for i:=1 to 4 do
      for j:=1 to 4 do
        if a[i,j]<>b[i,j] then inc(total);
    total:=total div 2;
    writeln(total);
end.
