program p1044;
var a:array[0..100] of longint;
    n,i,j,k,s:longint;
begin
    fillchar(a,sizeof(a),0);
    readln(n);
    n:=n div 2;
    for i:=0 to 9 do a[i]:=1;
    for i:=1 to n-1 do
      for j:=9*i downto 0 do
         for k:=9 downto 1 do a[j+k]:=a[j+k]+a[j];
    s:=0;
    for i:=0 to 9*n do s:=s+sqr(a[i]);
    writeln(s);
end.