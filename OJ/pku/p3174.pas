program p3174;
const maxn=770;
      maxslope=30000;
      eps=0.0000001;
      infinity=1000000000;
type node=record
	 x,y:longint;
     end;
var a:array[1..maxn] of node;
    slope:array[1..maxn,1..maxn] of double;
    w:array[1..maxslope,1..3] of longint;
    i,j,k,n,ans:longint;
begin
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    for i:=1 to n do
        for j:=i+1 to n do begin
	    if a[i].x<>a[j].x then slope[i,j]:=(a[i].y-a[j].y)/(a[i].x-a[j].x) else slope[i,j]:=infinity;
	    slope[j,i]:=slope[i,j];
	end;
    ans:=0;
    for i:=1 to n-2 do
	for j:=i+1 to n-1 do
	    for k:=j+1 to n do
		if abs(slope[i,j]-slope[j,k])<eps then begin
		    inc(ans);
		    w[ans,1]:=i; w[ans,2]:=j; w[ans,3]:=k;
		end;
    writeln(ans);
    for i:=1 to ans do writeln(w[i,1],' ',w[i,2],' ',w[i,3]);
end.
