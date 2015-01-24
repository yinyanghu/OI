program gaojian;
var s1,s2,s:string;
    a,b,c:array[1..1000] of integer;
    i,j,k,x,l1,l2,l3:integer;
begin
    readln(s1);
    readln(s2);
    l1:=length(s1); l2:=length(s2);
    {**************************************************}
    if (l1<l2) or ((l1=l2) and (s1<s2)) then begin
        s:=s1; s1:=s2; s2:=s;
        k:=l1; l1:=l2; l2:=k;
        write('-');
    end;
    for i:=1 to l1 do a[i]:=ord(s1[l1-i+1])-ord('0');
    for i:=1 to l2 do b[i]:=ord(s2[l2-i+1])-ord('0');
    i:=1; x:=0;
    while (i<=l1) do begin
        x:=a[i]-b[i]+x+10;
        c[i]:=x mod 10;
        x:=x div 10 -1;
        inc(i);
    end;
    l3:=i;
    while (c[l3]=0) do dec(l3);
    {**************************************************}
    for i:=l3 downto 1 do write(c[i]);
end.
