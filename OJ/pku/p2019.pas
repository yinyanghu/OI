program p2019;
const maxn=250;
var a,fmax,fmin,ans:array[1..maxn,1..maxn] of longint;
    maximum,minimum,n,m,i,j,b,x,y:longint;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
procedure prepare;
 var i,j,k:longint;
 begin
     for i:=1 to n do
	for j:=1 to n-b+1 do begin
	    fmax[i,j]:=a[i,j]; fmin[i,j]:=a[i,j];
	    for k:=1 to b-1 do begin
	        fmax[i,j]:=max(fmax[i,j],a[i,j+k]);
		fmin[i,j]:=min(fmin[i,j],a[i,j+k]);
	    end;
	end;
 end;
 
begin
    readln(n,b,m);
    for i:=1 to n do
	for j:=1 to n do read(a[i,j]);
    prepare;
    fillchar(ans,sizeof(ans),255);
    for i:=1 to m do begin
        readln(x,y);
	if ans[x,y]<>-1 then begin
	    writeln(ans[x,y]);
	    continue;
	end;
	maximum:=fmax[x,y]; minimum:=fmin[x,y];
	for j:=1 to b-1 do begin
	    maximum:=max(maximum,fmax[x+j,y]);
	    minimum:=min(minimum,fmin[x+j,y]);
	end;
	ans[x,y]:=maximum-minimum;
	writeln(ans[x,y]);
    end;
end.
    