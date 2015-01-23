program p168;
var a:array[0..1001,0..1001] of longint;
    m,n,i,j:longint;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

begin
    readln(n,m);
    for i:=1 to n do
      for j:=1 to m do read(a[i,j]);
    for i:=0 to m+1 do begin
        a[0,i]:=maxlongint;
        a[n+1,i]:=maxlongint;
    end;
    for i:=0 to n+1 do begin
        a[i,0]:=maxlongint;
        a[i,m+1]:=maxlongint;
    end;
    for j:=m downto 1 do
       for i:=n downto 1 do
         a[i,j]:=min(a[i,j+1],min(a[i-1,j+1],min(a[i,j],a[i+1,j])));
    for i:=1 to n do begin
        for j:=1 to m-1 do write(a[i,j],' ');
        writeln(a[i,m]);
    end;
end.