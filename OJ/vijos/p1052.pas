program p1052;
const maxn=100;
var a:array[1..maxn,1..maxn] of double;
    b:array[1..maxn] of double;
    max,i,j,k,n:longint;
    sum:double;
procedure swap(var a,b:double);
 var t:double;
 begin
     t:=a; a:=b; b:=t;
 end;
 
begin
    readln(n);
    for i:=1 to n do begin
	for j:=1 to n do read(a[i,j]);
	readln(b[i]);
    end;
    for k:=1 to n do begin
        max:=k;
	for i:=k+1 to n do
	    if abs(a[i,k])>abs(a[max,k]) then max:=i;
	if max<>k then begin
	    for i:=k to n do swap(a[max,i],a[k,i]);
	    swap(b[max],b[k]);
	end;
	for i:=k+1 to n do a[k,i]:=a[k,i]/a[k,k];
	b[k]:=b[k]/a[k,k];
	for i:=k+1 to n do begin
	    for j:=k+1 to n do a[i,j]:=a[i,j]-a[i,k]*a[k,j];
	    b[i]:=b[i]-a[i,k]*b[k];
	end;
    end;
    for i:=n-1 downto 1 do begin
        sum:=0;
	for j:=i+1 to n do sum:=sum+a[i,j]*b[j];
	b[i]:=b[i]-sum;
    end;
    for i:=1 to n-1 do write(round(b[i]),' ');
    writeln(round(b[n]));
end.
