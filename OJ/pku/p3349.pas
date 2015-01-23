program p3349;
const maxn=100000;
type node=array[1..6] of longint;
var a:array[1..maxn] of node;
    i,j,n,k:longint;
procedure swap(var a,b:longint);inline;
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;

function check(a,b:node):longint;inline;
 var i:longint;
 begin
     for i:=1 to 6 do
	if a[i]>b[i] then exit(1)
	    else if a[i]<b[i] then exit(-1);
     check:=0;
 end;

procedure sort(l,r:longint);
 var i,j:longint;
     x,y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1];
     repeat
	while check(a[i],x)<0 do inc(i);
	while check(a[j],x)>0 do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    readln(n);
    for i:=1 to n do begin
        for j:=1 to 6 do read(a[i,j]);
	for j:=1 to 5 do
	    for k:=j+1 to 6 do
		if a[i,j]>a[i,k] then swap(a[i,j],a[i,k]);
    end;
    sort(1,n);
    for i:=2 to n do
	if check(a[i],a[i-1])=0 then begin
	    writeln('Twin snowflakes found.');
	    halt;
        end;
    writeln('No two snowflakes are alike.');
end.
