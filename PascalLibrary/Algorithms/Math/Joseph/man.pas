program man;
var n,s,m,i,j,k:integer;
    a,b:array[1..1000] of integer;
begin
    write('N,S,M=');
    readln(n,s,m);
    for i:=1 to n do a[i]:=i;
    fillchar(b,sizeof(b),0);
    for i:=n downto 1 do begin
        k:=(s+m-2) mod i +1;
        b[i]:=a[k];
        s:=k;
        if k<i then for j:=k to i-1 do a[j]:=a[j+1];
    end;
    write('Chu Lie Shun Xu=');
    for i:=n downto 1 do write(b[i]:4);
    readln;
end.