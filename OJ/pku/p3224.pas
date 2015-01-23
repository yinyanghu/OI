program p3224;
var a:array[1..100,1..100] of longint;
    i,j,k,n,total,ans:longint;
begin
    readln(n);
    for i:=1 to n do
      for j:=1 to n do read(a[i,j]);
    total:=0;
    for i:=1 to n do begin
        k:=0;
        for j:=1 to n do
          if a[i,j]>a[j,i] then inc(k);
        if k>total then begin
            total:=k;
            ans:=i;
        end;
    end;
    writeln(ans);
end.