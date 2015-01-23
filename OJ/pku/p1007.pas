program p1007;
var a:array[1..200,1..100] of char;
    s:array[1..200,1..2] of longint;
    i,j,k,m,n:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:array[1..2] of longint;
 begin
     i:=l; j:=r; x:=s[(l+r) div 2,1];
     repeat
        while s[i,1]<x do inc(i);
        while s[j,1]>x do dec(j);
        if i<=j then begin
            y:=s[i]; s[i]:=s[j]; s[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n,m);
    for i:=1 to m do begin
        for j:=1 to n do read(a[i,j]);
        readln;
    end;
    for i:=1 to m do begin
        s[i,2]:=i;
        s[i,1]:=0;
        for j:=1 to n-1 do begin
            for k:=j+1 to n do
              if a[i,j]>a[i,k] then inc(s[i,1]);
        end;
    end;
    sort(1,m);
    for i:=1 to m do begin
        k:=s[i,2];
        for j:=1 to n do write(a[k,j]);
        writeln;
    end;
end.