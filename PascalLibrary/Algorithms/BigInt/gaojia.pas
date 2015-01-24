program gaojia;
var s1,s2:string;
    a,b,c:array[1..1000] of integer;
    i,j,k,l1,l2:integer;
begin
    readln(s1);
    readln(s2);
    l1:=length(s1); l2:=length(s2);
    for i:=1 to l1 do a[i]:=ord(s1[l1-i+1])-ord('0');
    for i:=1 to l2 do b[i]:=ord(s2[l2-i+1])-ord('0');
    {******************************************}
    k:=0;
    for i:=1 to l1+l2 do begin
        c[i]:=a[i]+b[i]+k;
        k:=c[i] div 10;
        c[i]:=c[i] mod 10;
    end;
    k:=l1+l2;
    while (c[k]=0) do dec(k);
    {******************************************}
    for i:=k downto 1 do write(c[i]);   {for i:=1 to k do write(c[k-i+1]);}
end.