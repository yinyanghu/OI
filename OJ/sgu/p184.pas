program p184;
var p,m,c,k,r,v,min,i:longint;
    a:array[1..3] of longint;
begin
    read(p,m,c,k,r,v);
    a[1]:=p div k;
    a[2]:=m div r;
    a[3]:=c div v;
    min:=maxlongint;
    for i:=1 to 3 do
      if a[i]<min then min:=a[i];
    writeln(min);
end.