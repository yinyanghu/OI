program sparsetable;
const maxn=100000;
      maxlogn=20;
var n,m,k,l,r,i,j,ans:longint;
    f:array[0..maxn,0..maxlogn] of longint;
    w:array[1..maxn] of longint;
    s:array[0..maxlogn] of longint;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

begin
    assign(input,'st.in'); reset(input);
    assign(output,'st.out'); rewrite(output);
    readln(n);
    s[0]:=1;
    for i:=1 to maxlogn do s[i]:=s[i-1]*2;
    k:=0;
    for i:=1 to n do begin
	if s[k+1]=i then inc(k);
	w[i]:=k;
    end;
    for i:=1 to n do read(f[i,0]);
    k:=w[n];
    for j:=1 to k do
	for i:=1 to (n-s[j]+1) do
	    f[i,j]:=min(f[i,j-1],f[i+s[j-1],j-1]); //max
    read(m);  
    for i:=1 to m do begin
	read(l,r);
	k:=w[r-l+1];
	ans:=min(f[l,k],f[r-s[k]+1,k]);
	writeln(ans);
    end;
    close(input);
    close(output);
end.
