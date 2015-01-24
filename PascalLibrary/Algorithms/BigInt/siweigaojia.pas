program siweigaojia;
var s1,s2:string;
    a,b,c,d:array[1..1000] of longint;
    i,j,k,l1,l2,max,j1,j2:longint;
    code:integer;
begin
    readln(s1);
    readln(s2);
    l1:=length(s1); l2:=length(s2);
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
    fillchar(c,sizeof(c),0);
    j1:=0; k:=l1;
    while (k>0) do begin
        inc(j1);
        val(copy(s1,k-3,4),a[j1],code);
        s1:=copy(s1,1,k-4);
        k:=length(s1);
    end;
    j2:=0; k:=l2;
    while (k>0) do begin
        inc(j2);
        val(copy(s2,k-3,4),b[j2],code);
        s2:=copy(s2,1,k-4);
        k:=length(s2);
    end;
    k:=0;
    for i:=1 to j1+j2 do begin
          c[i]:=a[i]+b[i]+k;
          k:=c[i] div 10000;
          c[i]:=c[i] mod 10000;
    end;
    max:=j1+j2;
    while (c[max]=0) do dec(max);
    j:=1;
    for i:=1 to max do begin
        d[j]:=c[i] mod 10;
        d[j+1]:=c[i] div 10 mod 10;
        d[j+2]:=c[i] div 100 mod 10;
        d[j+3]:=c[i] div 1000;
        inc(j,4);
    end;
    while (d[j]=0) do dec(j);
    for i:=j downto 1 do write(d[i]);
end.