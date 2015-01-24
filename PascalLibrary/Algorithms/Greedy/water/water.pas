program water;
var i,j,n:integer;
    s,k:longint;
    a:array[1..200,1..2] of longint;
begin
    write('Enter n=');
    readln(n);
    for i:=1 to n do begin
        readln(a[i,1]);
        a[i,2]:=i;
    end;
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if a[i,1]>a[j,1] then begin
            k:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=k;
            k:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=k;
        end;
    s:=0;
    for i:=1 to n do begin
        s:=s+(n-i)*a[i,1];
        writeln(a[i,2],' ');
    end;
    writeln(s);
    readln;
end.