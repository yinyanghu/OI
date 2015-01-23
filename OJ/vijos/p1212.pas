program p1212;
const maxn=1000;
var c,num:array[1..maxn] of longint;
    g:array[1..maxn,1..maxn] of longint;
    x1,x2,y1,y2,v:array[1..maxn] of double;
    mark:array[1..maxn] of boolean;
    total,a,i,j,m,t,r:longint;

function extendpath(u:longint):boolean;
 var i:longint;
 begin
     for i:=1 to num[u] do
         if (not mark[g[u,i]]) then begin
	     mark[g[u,i]]:=true;
	     if (c[g[u,i]]=0) or (extendpath(c[g[u,i]])) then begin
		 c[g[u,i]]:=u;
		 exit(true);
	     end;
         end;
     extendpath:=false;
 end;

begin
    fillchar(c,sizeof(c),0);
    fillchar(num,sizeof(num),0);
    read(r,a,t);
    for i:=1 to a do read(x1[i],y1[i]);
    for i:=1 to r do read(x2[i],y2[i],v[i]);
    for i:=1 to r do
       for j:=1 to a do
	   if sqrt(sqr(x2[i]-x1[j])+sqr(y2[i]-y1[j]))/v[i]<=t then begin
	       inc(num[i]);
	       g[i,num[i]]:=j;
           end;
    total:=0;
    for i:=1 to r do begin
        fillchar(mark,sizeof(mark),false);
        if extendpath(i) then inc(total);
    end;
    writeln(total);
end.
