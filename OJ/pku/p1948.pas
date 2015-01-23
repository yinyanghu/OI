program p1948;
const maxn=40;
      maxl=800;
var f:array[0..maxl,0..maxl] of boolean;
    a:array[1..maxn] of longint;
    i,j,k,n,m,total:longint;
    s,max:double;
function calc(a,b,c:longint):double;
 var x:double;
 begin
     x:=(a+b+c)/2;
     calc:=sqrt(x*(x-a)*(x-b)*(x-c));
 end;
begin
    readln(n); total:=0;
    fillchar(f,sizeof(f),false);
    for i:=1 to n do begin
        readln(a[i]);
        total:=total+a[i];
    end;
    f[0,0]:=true;
    m:=total div 2+1;
    for i:=1 to n do
        for j:=m downto 0 do
        	   for k:=m downto 0 do 
            	if ((j>=a[i]) and (f[j-a[i],k])) or ((k>=a[i]) and (f[j,k-a[i]])) or (f[j,k]) then f[j,k]:=true;
    max:=0;
    for i:=1 to m do
        for j:=1 to m do 
        	   if f[i,j] then begin
                k:=total-i-j;
                if (i+j>k) and (i+k>j) and (j+k>i) then begin
                    s:=calc(i,j,k);
                    if s>max then max:=s;
                end;
            end;
    if max=0 then writeln(-1) else writeln(trunc(max*100));
end.