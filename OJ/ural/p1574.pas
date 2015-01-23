program p1574;
const maxn=100000;
var n,i,k,total:longint;
    a:array[1..maxn] of char;
    sum,s:array[0..maxn] of longint;
    ch:char;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

begin
    while not eof do begin
        read(ch);
	if ch in ['(',')'] then begin
	    inc(n);
	    a[n]:=ch;
	end;
    end;
     for i:=1 to n do
	if a[i]='(' then sum[i]:=sum[i-1]+1
	   else sum[i]:=sum[i-1]-1;
    if sum[n]<>0 then begin
	writeln(0);
	halt;
    end;
    sum[0]:=0;
    s[n]:=sum[n];
    for i:=n-1 downto 0 do s[i]:=min(s[i+1],sum[i]);
    k:=0; total:=0;
    for i:=1 to n do begin
	if (sum[n]-sum[i-1]+k>=0) and (s[i]-sum[i-1]>=0) then inc(total);
	k:=min(k,sum[i]);
    end;
    writeln(total);
end.