program gaocheng;
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
    fillchar(c,sizeof(c),0);
    for i:=1 to l1 do
      for j:=1 to l2+1 do begin
          c[i+j-1]:=c[i+j-1]+a[i]*b[j]+k;
          k:=c[i+j-1] div 10;
          c[i+j-1]:=c[i+j-1] mod 10;
      end;
    k:=l1+l2+2;
    while (c[k]=0) do dec(k);
    {******************************************}
    for i:=k downto 1 do write(c[i]);   {for i:=1 to k do write(c[k-i+1]);}
end.