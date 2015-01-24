program gaochu;
var s1,s2:string;
    a,c:array[1..1000] of integer;
    i,l1,k,code,x,b:integer;
begin
    readln(s1);
    readln(s2);
    l1:=length(s1);
    for i:=1 to l1 do a[i]:=ord(s1[i])-ord('0');
    val(s2,b,code);
    {******************************************}
    x:=0;
    for i:=1 to l1 do begin
        c[i]:=(x*10+a[i]) div b;
        x:=(x*10+a[i]) mod b;
    end;
    k:=1;
    while (c[k]=0) and (k<l1) do inc(k);
    {******************************************}
    for i:=k to l1 do write(c[i]);   {for i:=l1 to k do write(c[k-i+1]);}
writeln;
	writeln(x);
end.
