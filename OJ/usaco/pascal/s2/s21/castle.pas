{
ID:lijianx1
PROG:castle
LANG:PASCAL
}
program castle;
const maxn=50;
var m,n,total,max,x,y,i,j:longint;
    num,a:array[1..maxn,1..maxn] of longint;
    size:array[1..maxn*maxn] of longint;
    ch:char;
function check(x,y,k:longint):boolean;
 begin
     case k of
	 1:if a[x,y]>=8 then check:=false else check:=true;
	 2:if odd(a[x,y] div 2) then check:=false else check:=true;
	 3:if odd(a[x,y] div 4) then check:=false else check:=true;
	 4:if odd(a[x,y]) then check:=false else check:=true;
     end;
 end;

procedure floodfill(x,y:longint);
 begin
     if num[x,y]>0 then exit;
     num[x,y]:=total;
     inc(size[total]);
     if check(x,y,1) then floodfill(x+1,y);
     if check(x,y,2) then floodfill(x-1,y);
     if check(x,y,3) then floodfill(x,y+1);
     if check(x,y,4) then floodfill(x,y-1);
 end;

begin
    assign(input,'castle.in'); reset(input);
    assign(output,'castle.out'); rewrite(output);
    readln(m,n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do
       for j:=1 to m do read(a[i,j]);
    close(input);
    total:=0; max:=0;
    fillchar(num,sizeof(num),0);
    for i:=1 to n do
	for j:=1 to m do
	    if num[i,j]=0 then begin
		inc(total);
		size[total]:=0;
		floodfill(i,j);
		if size[total]>max then max:=size[total];
	    end;
    writeln(total);
    writeln(max);

    max:=0;
    for i:=1 to m do begin
	for j:=n-1 downto 1 do
	   if num[j,i]<>num[j+1,i] then
		if size[num[j+1,i]]+size[num[j,i]]>max then begin
		    max:=size[num[j+1,i]]+size[num[j,i]];
		    x:=j+1; y:=i; ch:='N';
		end;
	if i=m then break;
	for j:=n downto 1 do
	   if num[j,i]<>num[j,i+1] then
		if size[num[j,i]]+size[num[j,i+1]]>max then begin
		    max:=size[num[j,i]]+size[num[j,i+1]];
		    x:=j; y:=i; ch:='E';
		end;
    end;
    writeln(max);
    writeln(x,' ',y,' ',ch);
    close(output);
end.
