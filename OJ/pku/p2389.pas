program p2389;
const maxn=50;
var a,b:array[1..maxn] of longint;
    c:array[1..maxn*2] of longint;
    l1,l2,k,i,j:longint;
    s:string;
begin
    readln(s);
    l1:=length(s);
    for i:=1 to l1 do a[i]:=ord(s[l1-i+1])-48;
    readln(s);
    l2:=length(s);
    for i:=1 to l2 do b[i]:=ord(s[l2-i+1])-48;
    k:=0;
    fillchar(c,sizeof(c),0);
    for i:=1 to l1 do
	for j:=1 to l2+1 do begin
	    c[i+j-1]:=c[i+j-1]+a[i]*b[j];
	    k:=c[i+j-1] div 10;
	    c[i+j]:=c[i+j]+k;
	    c[i+j-1]:=c[i+j-1] mod 10;
	end;
    k:=maxn*2;
    while (k>0) and (c[k]=0) do dec(k);
    for i:=k downto 1 do write(c[i]);
    writeln;
end.
