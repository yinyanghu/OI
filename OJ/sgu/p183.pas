program p183;
const maxn=10000;
      maxm=100;
      infinity=100000000;
var f:array[1..maxn,1..maxm] of longint;
    c:array[1..maxn] of longint;
    n,m,i,j,ans,curmin:longint;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
begin
    readln(n,m);
    for i:=1 to n do read(c[i]);
    ans:=infinity;
    for i:=1 to n-1 do begin
        curmin:=infinity;
	for j:=m-1 downto 1 do begin
	    if i+j-m>0 then curmin:=min(curmin,f[i+j-m,m-j]) else curmin:=min(curmin,c[i]);
	    if i+j<=n then begin
	        f[i,j]:=curmin+c[i+j];
		if i>=n-m+1 then ans:=min(ans,f[i,j]);
	    end;
	end;
    end;
    writeln(ans);
end.
