program p3250;
var n,i,j:longint;
    total:int64;
    a,num,id:array[0..80000] of longint;
begin
    readln(n);
    for i:=1 to n do readln(a[i]);
    id[n]:=0; total:=0;
    for i:=n-1 downto 1 do begin
        j:=i+1;
        while (j>0) and (a[j]<a[i]) do begin
            inc(num[i]);
            inc(num[i],num[j]);
            j:=id[j];
        end;
        id[i]:=j;
        total:=total+num[i];
    end;
    writeln(total);
end.