program p1573;
var i,k,ans:longint;
    ok:array[1..3] of boolean;
    a:array[1..3] of longint;
    s:string;
begin
    for i:=1 to 3 do read(a[i]);
    readln(k);
    for i:=1 to 3 do ok[i]:=false;
    for i:=1 to k do begin
        readln(s);
        if s='Red' then ok[2]:=true
           else if s='Yellow' then ok[3]:=true
                else if s='Blue' then ok[1]:=true;
    end;
    ans:=1;
    for i:=1 to 3 do
       if ok[i] then ans:=ans*a[i];
    writeln(ans);
end.