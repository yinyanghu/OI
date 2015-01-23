program p2110;
const limitsize=110;
      maxn=100;
var a:array[1..maxn,1..maxn] of longint;
    flag:array[1..maxn,1..maxn] of boolean;
    n,i,j,left,right,mid,max,min:longint;
procedure bfs(x,y,low,high:longint);
 begin
     if not flag[n,n] then exit;
     if (a[x,y]<low) or (a[x,y]>high) then exit;
     flag[x,y]:=false;
     if (x-1>=1) and (flag[x-1,y]) then bfs(x-1,y,low,high);
     if (x+1<=n) and (flag[x+1,y]) then bfs(x+1,y,low,high);
     if (y-1>=1) and (flag[x,y-1]) then bfs(x,y-1,low,high);
     if (y+1<=n) and (flag[x,y+1]) then bfs(x,y+1,low,high);
 end;

function check(delta:longint):boolean;
 var i:longint;
 begin
     if min+delta>max then exit(true);
     for i:=min to max-delta do begin
         fillchar(flag,sizeof(flag),true);
	 bfs(1,1,i,i+delta);
	 if not flag[n,n] then exit(true);
     end;
     check:=false;
 end;

begin
    readln(n);
    max:=-1; min:=maxlongint;
    for i:=1 to n do
	for j:=1 to n do begin
	    read(a[i,j]);
	    if a[i,j]>max then max:=a[i,j];
	    if a[i,j]<min then min:=a[i,j];
	end;
    left:=0; right:=limitsize;
    while left<=right do begin
	mid:=(left+right) shr 1;
	if not check(mid) then left:=mid+1 else right:=mid-1;
    end;
    writeln(left);
end.
