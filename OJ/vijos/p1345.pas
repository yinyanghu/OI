program sudoku;
const maxn=1 shl 9-1;
      e:array[0..8] of integer=(1,2,4,8,16,32,64,128,256);
type node=record
	 x,y:longint;
     end;
var h,l,q:array[1..9] of longint;
    a,s:array[1..9,1..9] of longint;
    w:array[1..81] of node;
    total:longint;
    flag:boolean;
procedure prepare;
 var i,j,x,y,k:longint;
 begin
     k:=0;
     for x:=1 to 3 do
	for y:=1 to 3 do begin
	    inc(k);
	    for i:=(x-1)*3+1 to x*3 do
		for j:=(y-1)*3+1 to y*3 do s[i,j]:=k;
	end;
 end;

procedure init;
 var i,j:longint;
     c:char;
 begin
     fillchar(h,sizeof(h),0);
     fillchar(l,sizeof(l),0);
     fillchar(q,sizeof(q),0); 
     total:=0; flag:=false;
     for i:=1 to 9 do 
	 for j:=1 to 9 do begin
	     read(c);
	     a[i,j]:=ord(c)-48;
	     if a[i,j]<>0 then begin
		 h[i]:=h[i]+1 shl (a[i,j]-1);
		 l[j]:=l[j]+1 shl (a[i,j]-1);
	 	 q[s[i,j]]:=q[s[i,j]]+1 shl (a[i,j]-1);
	     end else begin
	 	 inc(total);
	 	 w[total].x:=i; w[total].y:=j;
	     end;
	 end;
     readln;
 end;

procedure print;
 var i,j:longint;
 begin
     for i:=1 to 9 do
       for j:=1 to 9 do write(a[i,j]);
     writeln;
     flag:=true;
 end;

function find(k:longint):longint;
 var x,y,mid:longint;
 begin
     x:=0; y:=8;
     while x<=y do begin
	 mid:=(x+y) div 2;
	 if e[mid]=k then exit(mid+1);
	 if e[mid]<k then x:=mid+1 else y:=mid-1;
     end;
 end;

procedure solve(k:longint);
 var p,pos,x,y:longint;
 begin
     if k>total then begin 
	 print;
	 exit;
     end;
     x:=w[k].x; y:=w[k].y;
     pos:=maxn and not (h[x] or l[y] or q[s[x,y]]);
     while pos<>0 do begin
	 p:=pos and -pos;
	 pos:=pos-p;
	 h[x]:=h[x]+p; l[y]:=l[y]+p; q[s[x,y]]:=q[s[x,y]]+p;
	 a[x,y]:=find(p);
	 solve(k+1);
	 if flag then exit;
	 a[x,y]:=0;
	 h[x]:=h[x]-p; l[y]:=l[y]-p; q[s[x,y]]:=q[s[x,y]]-p;
     end;
 end;

procedure main;
 var n,i:longint;
 begin
     readln(n);
     prepare;
     for i:=1 to n do begin
	 init;
	 solve(1);
     end;
 end;

begin
    main;
end.
