program p1007;
var a:array[-1..20,-1..20] of qword;
    i,j,k,m,n:longint;
    total:qword;
begin
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n-1 do a[0,i]:=1;
    for i:=1 to m-1 do
       for j:=0 to n-1 do
         for k:=0 to n-1 do
            if not ((k=j-1) or (k=j+1)) then a[i,j]:=a[i,j]+a[i-1,k];
    total:=0;
    for i:=0 to n-1 do total:=total+a[m-1,i];
    writeln(total);
end.