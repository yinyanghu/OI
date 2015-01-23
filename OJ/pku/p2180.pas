program p2180;
const maxn=25000;
      limitsize=25;
type point=record
	 x,y,z:longint;
     end;
var n,i,k,ans:longint;
    ch:char;
    a:array[1..maxn] of point;
    flag:array[-limitsize..limitsize,-limitsize..limitsize,-limitsize..limitsize] of boolean;
procedure wrong;
 begin
     writeln(-1);
     halt;
 end;

function compare(x:longint; a,b:point):longint;
 begin
     if x=1 then begin
         if a.x<>b.x then begin
            if a.x<b.x then exit(1) else exit(-1);
         end else if a.y<>b.y then begin
            if a.y<b.y then exit(1) else exit(-1);
         end else begin
             if a.z<b.z then exit(1) else if a.z>b.z then exit(-1) else exit(0);
         end;
     end;
     if x=2 then begin
         if a.x<>b.x then begin
            if a.x<b.x then exit(1) else exit(-1);
         end else if a.z<>b.z then begin
            if a.z<b.z then exit(1) else exit(-1);
         end else begin
             if a.y<b.y then exit(1) else if a.y>b.y then exit(-1) else exit(0);
         end;
     end;
     if x=3 then begin
         if a.y<>b.y then begin
            if a.y<b.y then exit(1) else exit(-1);
         end else if a.z<>b.z then begin
            if a.z<b.z then exit(1) else exit(-1);
         end else begin
             if a.x<b.x then exit(1) else if a.x>b.x then exit(-1) else exit(0);
         end;
     end;
 end;

procedure sort(l,r,k:longint);
 var i,j:longint;
     x,y:point;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1];
     repeat
	while compare(k,a[i],x)=1 do inc(i);
	while compare(k,a[j],x)=-1 do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j,k);
     if i<r then sort(i,r,k);
 end;

begin
    readln(n);
    with a[1] do begin
        x:=0; y:=0; z:=0;
    end;
    fillchar(flag,sizeof(flag),true);
    flag[0,0,0]:=false;
    for i:=2 to n do begin
        read(k); read(ch); read(ch); readln;
	case ch of
	    'L':begin
		    a[i].x:=a[k].x-1; a[i].y:=a[k].y; a[i].z:=a[k].z;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	    'R':begin
		    a[i].x:=a[k].x+1; a[i].y:=a[k].y; a[i].z:=a[k].z;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	    'F':begin
		    a[i].x:=a[k].x; a[i].y:=a[k].y; a[i].z:=a[k].z-1;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	    'B':begin
		    a[i].x:=a[k].x; a[i].y:=a[k].y; a[i].z:=a[k].z+1;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	    'O':begin
		    a[i].x:=a[k].x; a[i].y:=a[k].y+1; a[i].z:=a[k].z;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	    'U':begin
		    a[i].x:=a[k].x; a[i].y:=a[k].y-1; a[i].z:=a[k].z;
		    if (flag[a[i].x,a[i].y,a[i].z]) then flag[a[i].x,a[i].y,a[i].z]:=false else wrong;
	        end;
	end;
    end;
    ans:=0;
    sort(1,n,1);
    for i:=2 to n do
	if (a[i].x=a[i-1].x) and (a[i].y=a[i-1].y) and (a[i].z=a[i-1].z+1) then inc(ans);
    sort(1,n,2);
    for i:=2 to n do
	if (a[i].x=a[i-1].x) and (a[i].z=a[i-1].z) and (a[i].y=a[i-1].y+1) then inc(ans);
    sort(1,n,3);
    for i:=2 to n do
	if (a[i].y=a[i-1].y) and (a[i].z=a[i-1].z) and (a[i].x=a[i-1].x+1) then inc(ans);
    ans:=6*n-ans*2;
    for i:=1 to n do
	if a[i].y=0 then dec(ans);
    writeln(ans);
end.
