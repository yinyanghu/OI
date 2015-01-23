program victoria3;
var a:array[1..300,1..300] of boolean;
    s:array[1..300] of boolean;
    i,j,k,n,l,p,total:longint;
begin
    readln(n);
    for i:=1 to n do begin
        read(k);
        while k<>0 do begin
            a[i,k]:=true;
            read(k);
        end;
        readln;
    end;
    for k:=1 to n do
      for i:=1 to n do
        for j:=1 to n do
          if a[i,k] and a[k,j] then a[i,j]:=true;
    total:=0;
    for i:=1 to n do
      if not s[i] then begin
          inc(total);
          for j:=i+1 to n do
            if a[i,j] and a[j,i] then s[j]:=true;
      end;
    writeln(total);
end.