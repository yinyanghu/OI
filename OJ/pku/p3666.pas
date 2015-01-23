program p3666;
const maxn=2000;
var a,w:array[1..maxn] of longint;
    f:array[false..true,1..maxn] of longint;
    n,i,ans:longint;
procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=w[(l+r) shr 1];
     repeat
        while w[i]<x do inc(i);
	while w[j]>x do dec(j);
	if i<=j then begin
	    y:=w[i]; w[i]:=w[j]; w[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

procedure dp;
 var i,j:longint;
     flag:boolean;
 begin
     sort(1,n);
     flag:=false;
     for i:=1 to n do
	if (a[1]<=w[i]) then f[flag,i]:=0 else f[flag,i]:=a[1]-w[i];
     for i:=2 to n do begin
         flag:=not flag;
         f[flag,1]:=f[not flag,1]+abs(a[i]-w[1]);
	 for j:=2 to n do f[flag,j]:=min(f[flag,j-1],f[not flag,j]+abs(a[i]-w[j]));
     end;
     for i:=1 to n do ans:=min(ans,f[flag,i]);
 end;

begin
    readln(n);
    for i:=1 to n do begin
        readln(a[i]);
	w[i]:=a[i];
    end;
    ans:=maxlongint;
    dp;
    for i:=1 to n do begin
        a[i]:=a[i]*-1;
	w[i]:=w[i]*-1;
    end;
    dp;
    writeln(ans);
end.
