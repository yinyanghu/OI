program p3659;
const maxn=10000;
      maxedge=20;
      root=1;
type edgenode=record
	 num:longint;
	 w:array[1..maxedge] of longint;
     end;
var f:array[1..maxn,0..2] of longint;
    a:array[1..maxn] of edgenode;
    i,ans,n,x,y:longint;

function min(a,b:longint):longint;
 begin
     if a=-1 then exit(b);
     if b=-1 then exit(a);
     if a<b then min:=a else min:=b;
 end;

procedure dp(x,parent:longint);
 var i,k,child,temp:longint;
 begin
     k:=a[x].num;
     if ((k=1) and (parent>0)) or (k=0) then begin
         f[x,0]:=-1; f[x,1]:=0; f[x,2]:=1;
	 exit;
     end;
     f[x,0]:=0; f[x,1]:=0; f[x,2]:=1; 
     for i:=1 to k do begin
         child:=a[x].w[i];
	 if (child<>parent) then begin
	     dp(child,x);
	     f[x,1]:=f[x,1]+min(f[child,0],f[child,2]);
	     f[x,2]:=f[x,2]+min(f[child,1],f[child,2]);
	 end;
     end;
     f[x,0]:=-1;
     for i:=1 to k do begin
         child:=a[x].w[i];
	 if (child<>parent) then begin
	     temp:=f[x,1]-min(f[child,0],f[child,2])+f[child,2];
	     if (f[x,0]<0) or (f[x,0]>temp) then f[x,0]:=temp;
	 end;
     end;
 end;

begin
    readln(n);
    for i:=1 to n do a[i].num:=0;
    for i:=1 to n-1 do begin
	readln(x,y);
	inc(a[x].num); a[x].w[a[x].num]:=y;
	inc(a[y].num); a[y].w[a[y].num]:=x;
    end;
    dp(root,-1);
    ans:=min(f[root,0],f[root,2]);
    writeln(ans);
end.
