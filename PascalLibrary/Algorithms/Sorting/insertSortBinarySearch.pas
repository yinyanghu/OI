program erfenfasort;
var i,j,n,x,h,l,m:integer;
    a:array[1..10000] of integer;
begin
    writeln('Enter a number=');
    readln(n);
    randomize;
    for i:=1 to n do a[i]:=random(101);  {0..100}
 {**************************************************}
    for i:=2 to n do begin
        x:=a[i];
        l:=1;
        h:=i-1;
        while l<=h do begin                   {er fen fa pai xu}
            m:=(l+h) div 2;
            if x<a[m] then h:=m-1
              else l:=m+1;
        end;
        for j:=i-1 downto l do a[j+1]:=a[j];
        a[l]:=x;
    end;
 {**************************************************}
    writeln;
    for i:=1 to n do begin
        write(a[i]:7);
        if (i mod 8)=0 then writeln;
    end;
    readln;
end.
