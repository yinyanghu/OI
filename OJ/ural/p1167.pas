program p1167;
const maxn=500;
var n,d,i,j,k:longint;
    a,b:array[0..500] of longint;
    f1,f2:array[1..maxn] of longint;
begin
    readln(n,d);
    fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
    for i:=1 to n do begin
        readln(j);
        a[i]:=a[i-1]+ord(j=0);
	b[i]:=b[i-1]+ord(j=1);
    end;
    fillchar(f1,sizeof(f1),127);
    fillchar(f2,sizeof(f2),127);
    for i:=1 to n do f1[i]:=a[i]*b[i];
    for i:=2 to d do begin
        for j:=i to n do
	    for k:=1 to j-i+1 do 
               if f1[j-k]+(a[j]-a[j-k])*(b[j]-b[j-k])<f2[j] then 
		   f2[j]:=f1[j-k]+(a[j]-a[j-k])*(b[j]-b[j-k]);
	f1:=f2;
    end;
    writeln(f1[n]);
end.