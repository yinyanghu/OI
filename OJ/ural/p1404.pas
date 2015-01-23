program p1404;
var a:array[1..100] of longint;
    i,n:longint;
    s:string;
begin
    readln(s);
    n:=length(s);
    for i:=1 to n do a[i]:=ord(s[i])-97;
    for i:=2 to n do
      while (a[i]<a[i-1]) do a[i]:=a[i]+26;
    for i:=0 to n-2 do a[n-i]:=a[n-i]-a[n-i-1];
    a[1]:=a[1]-5;
    for i:=1 to n do begin
        if a[i]<0 then a[i]:=a[i]+26;
        s[i]:=chr(97+a[i]);
    end;
    writeln(s);
end.