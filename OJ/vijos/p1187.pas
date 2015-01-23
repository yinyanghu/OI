program p1187;
var f:array[-3..1000,-3..1000] of int64;
    i,j,n,m,x1,y1,x2,y2:longint;
begin
   readln(n,m);
   readln(x1,y1);
   readln(x2,y2);
   fillchar(f,sizeof(f),0);
   f[x1,y1]:=1;
   for i:=1 to n do
     for j:=1 to m do
         if f[i,j]=0 then f[i,j]:=f[i-2,j-1]+f[i-2,j+1]+f[i-1,j-2]+f[i-1,j+2];
    if f[x2,y2]=0 then writeln('NO') else writeln(f[x2,y2],'00000000');
end.