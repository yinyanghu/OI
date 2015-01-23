program p1001;
var s:ansistring;
    a,c:array[1..20000] of longint;
    i,l,k,x,b:longint;
begin
    readln(b);
    readln(s);
    l:=length(s);
    for i:=1 to l do a[i]:=ord(s[i])-ord('0');
    x:=0;
    for i:=1 to l do begin
        c[i]:=(x*10+a[i]) div b;
        x:=(x*10+a[i]) mod b;
    end;
    if x=0 then x:=b;
    writeln(x);
end.