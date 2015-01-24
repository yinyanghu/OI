{
ID:lijianx1
PROG:ditch
LANG:PASCAL
}
program ditch;
const maxn=300;
type netnode=record
	 c,f:longint;
     end;
     node=record
	 l,p:longint;
     end;
var a:array[1..maxn,1..maxn] of netnode;
    w:array[1..maxn] of node;
    n,s,t,total:longint;
procedure init;
 var i,m,x,y,k:longint;
 begin
     assign(input,'ditch.in'); reset(input);
     readln(m,n);
     total:=0;
     fillchar(a,sizeof(a),0);
     for i:=1 to m do begin
	 readln(x,y,k);
	 inc(a[x,y].c,k);
     end;
     close(input);
 end;

function check:longint;
 var i:longint;
 begin
     i:=1;
     while (i<=n) and not ((w[i].l<>0) and (w[i].p=0)) do inc(i);
     if i>n then check:=0 else check:=i;
 end;

function ford(var k:longint):boolean;
 var i,j,m,x:longint;
 begin
     fillchar(w,sizeof(w),0);
     w[s].l:=s;
     repeat
	i:=check;
	if i=0 then exit(true);
	for j:=1 to n do
	    if (w[j].l=0) and ((a[i,j].c<>0) or (a[j,i].c<>0)) then begin
		if (a[i,j].f<a[i,j].c) then w[j].l:=i;
		if (a[j,i].f>0) then w[j].l:=-i;
	    end;
	    w[i].p:=1;
     until (w[t].l<>0);
     m:=t; k:=maxlongint;
     repeat
	j:=m; m:=abs(w[j].l);
	if (w[j].l<0) then x:=a[j,m].f-0;
	if (w[j].l>0) then x:=a[m,j].c-a[m,j].f;
	if k>x then k:=x;
     until m=s;
     ford:=false;
 end;

procedure fulkerson(k:longint);
 var m,x:longint;
 begin
     total:=total+k;
     m:=t;
     repeat
	x:=m; m:=abs(w[x].l);
	if w[x].l<0 then a[x,m].f:=a[x,m].f-k;
	if w[x].l>0 then a[m,x].f:=a[m,x].f+k;
     until m=s;
 end;

procedure print;
 begin
     assign(output,'ditch.out'); rewrite(output);
     writeln(total);
     close(output);
 end;

procedure main;
 var k:longint;
     flag:boolean;
 begin
     s:=1; t:=n;
     repeat
	flag:=ford(k);
	if flag then print else fulkerson(k);
     until flag;
 end;

begin
    init;
    main;
end.
