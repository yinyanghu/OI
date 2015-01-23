program p1090;
var a:array[0..1234567] of longint;
    n,k,ans,sum:longint;
    i,x:longint;
begin
    readln(n,k);
    sum:=0; ans:=0;
    for i:=1 to n do begin
        readln(x);
        sum:=(sum+x) mod k;
        ans:=ans+a[sum];
        if (sum=0) then inc(ans);
        ans:=ans mod 1234567;
        inc(a[sum]);
    end;
    writeln(ans);
end.