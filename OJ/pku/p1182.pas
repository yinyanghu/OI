program p1182;
const maxn=50000;
type note=record
         f,rank:longint;
     end;
var a:array[1..maxn] of note;
    prev,next:array[1..maxn] of longint;
    i,n,m,p,s,t,ans:longint;

function make(x:longint):longint;
 begin
     a[x].f:=x; a[x].rank:=0; 
     make:=x;
 end;

function root(x:longint):longint;
 begin
     if x=-1 then exit(-1)
	else begin
	    if (a[x].f<>-1) and (x<>a[x].f) then a[x].f:=root(a[x].f);
	    exit(a[x].f);
	end;
 end;

function get(x,y:longint):longint;
 var r1,r2:longint;
 begin
     r1:=root(x); r2:=root(y);
     if r1=r2 then exit(r1);
     if r1=-1 then exit(r2);
     if r2=-1 then exit(r1);
     if (a[r1].rank>a[r2].rank) then begin
	a[r2].f:=r1; exit(r1);
     end else begin
	 a[r1].f:=r2;
	 if a[r1].rank=a[r2].rank then inc(a[r2].rank);
	 exit(r2);
     end;
 end;

function check(t,x,y:longint):boolean;
 var r1,r2:longint;
 begin
     if (x>n) or (y>n) or ((t=2) and (x=y)) then exit(true);
     r1:=root(x); r2:=root(y);
     if (r1=-1) or (r2=-1) then exit(false);
     if t=1 then check:=(next[r1]=r2) or (prev[r1]=r2)
	else check:=(r1=r2) or (next[r2]=r1);
 end;

procedure union(t,x,y:longint);
 var r1,r2,a1,a2,a3:longint;
 begin
     r1:=root(x); r2:=root(y);
     if r1=-1 then r1:=make(x);
     if r2=-1 then r2:=make(y);
     if t=1 then begin
	 a1:=get(prev[r1],prev[r2]);
	 a2:=get(r1,r2);
	 a3:=get(next[r1],next[r2]);
     end else begin
	 a1:=get(prev[r1],next[r2]);
	 a2:=get(r1,prev[r2]);
	 a3:=get(next[r1],r2);
     end;
     if a1<>-1 then begin
	 next[a1]:=a2; prev[a1]:=a3;
     end;
     if a2<>-1 then begin
	 next[a2]:=a3; prev[a2]:=a1;
     end;
     if a3<>-1 then begin
	 next[a3]:=a1; prev[a3]:=a2;
     end;
 end;

begin
    readln(n,m);
    ans:=0;
    for i:=1 to n do begin
	a[i].f:=-1;
	prev[i]:=-1; next[i]:=-1;
    end;
    for i:=1 to m do begin
        readln(p,s,t);
	if check(p,s,t) then inc(ans)
	    else union(p,s,t);
    end;
    writeln(ans);
end.