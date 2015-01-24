program paichong;
const n=100;
      p=100;
var i,j,k,m:integer;
    a:array[1..p] of integer;
begin
    randomize;
    for i:=1 to p do a[i]:=i;
    j:=p;
    for i:=1 to n do begin
        k:=random(j)+1;
        m:=a[k]; a[k]:=a[j]; a[j]:=m;
        dec(j);
    end;
    for i:=1 to n do if (i mod 7=0) then writeln(a[i]:8)
       else write(a[i]:8);
end.