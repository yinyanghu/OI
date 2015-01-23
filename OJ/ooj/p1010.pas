program p1010;
var a:array[0..200,1..100] of 0..9;
    b:array[1..200] of 0..9;
    n,i,s,j,k,g,p:longint;

begin
    readln(n);
    read(s);
    a[0,100]:=1; i:=101; s:=abs(s);
    while s<>0 do begin
        dec(i);
        a[1,i]:=s mod 10;
        s:=s div 10;
    end;
    for i:=2 to n do begin
        read(s); s:=abs(s);
        for j:=i-1 downto 0 do begin
            g:=0;
            for k:=100 downto 1 do begin
                p:=a[j,k]*s+g;
                b[k]:=p mod 10;
                g:=p div 10;
            end;
            g:=0;
            for k:=100 downto 1 do begin
                p:=a[j+1,k]+b[k]+g;
                a[j+1,k]:=p mod 10;
                g:=p div 10;
            end;
        end;
    end;
    for i:=1 to n do begin
        j:=1;
        while (a[i,j]=0) and (j<>100) do inc(j);
        for k:=j to 100 do write(a[i,k]);
        writeln;
    end;
end.