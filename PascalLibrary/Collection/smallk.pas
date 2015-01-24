program smallk;
const maxn=1000;
var a:array[1..maxn] of integer;
    i,k,n:integer;
function p(s,t:integer):integer;
 var i,j,m,x:integer;
 begin
     i:=s; j:=t; x:=a[i];
     repeat
        while (a[j]>=x) and (j>i) do dec(j);
        if j>i then begin m:=a[i]; a[i]:=a[j]; a[j]:=m; end;
        while (a[i]<=x) and (i<j) do inc(i);
        if i<j then begin m:=a[j]; a[j]:=a[i]; a[i]:=m; end;
     until i=j;
     a[i]:=x;
     p:=i;
 end;

function find(s,t,k:integer):integer;
 var m,q:integer;
 begin
     if s=t then exit(a[s]);
     m:=p(s,t);
     q:=m-s+1;
     if k<=q then find:=find(s,m,k) else find:=find(m+1,t,k-q);
 end;

begin
    readln(n);
    for i:=1 to n do read(a[i]);
    readln(k);
    writeln('Kth Small=',find(1,n,k));
end.