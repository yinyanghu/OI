program rmq;
const maxn=10000;
      maxm=100;
type treenode=record
	 left,right,p:longint;
     end;
     setnode=record
	 rank,f:longint;
     end;
     asknode=record
	 num:longint;
	 f:array[1..maxm] of longint;
     end;
var tree:array[1..maxn] of treenode;
    root:array[1..maxn] of longint;
    a:array[1..maxn] of setnode;
    s:array[1..maxn] of longint;
    q:array[1..maxn] of asknode;
    flag:array[1..maxn] of boolean;
    i,m,n,x,y,treeroot:longint;

function creattree:longint;
 var i,pre,root:longint;
 begin
     tree[1].p:=-1; tree[1].left:=-1; tree[1].right:=-1;
     root:=1;
     for i:=2 to n do begin
	 pre:=i-1;
	 while (s[i]>s[pre]) and (pre<>-1) do pre:=tree[pre].p;         // min heap
	 //while (s[i]<s[pre]) and (pre<>-1) do pre:=tree[pre].p;       // max heap
	 tree[i].p:=pre;
	 tree[i].right:=-1;
	 if pre=-1 then begin
	    tree[i].left:=root;
	    tree[root].p:=i;
	    root:=i;
	 end else begin
	     tree[i].left:=tree[pre].right;
	     if tree[pre].right<>-1 then tree[tree[pre].right].p:=i;
	     tree[pre].right:=i;
	 end;
     end;
     creattree:=root;
 end;

function getroot(x:longint):longint;
 begin
     if a[x].f=-1 then exit(x)
	else begin
	    a[x].f:=getroot(a[x].f);
	    exit(a[x].f);
	end;
 end;

function get(x,y:longint):boolean;
 var r1,r2:longint;
 begin
     r1:=getroot(x); r2:=getroot(y);
     if r1=r2 then exit(false);
     if a[r1].rank=a[r2].rank then begin
         a[r2].f:=r1;
         inc(a[r1].rank);
         exit(true);
     end;
     if (a[r1].rank>a[r2].rank) then a[r2].f:=r1
        else a[r1].f:=r2;
     get:=true;
 end;

procedure lca(x:longint);
 var i:longint;
 begin
     root[getroot(x)]:=x;
     if tree[x].left<>-1 then begin
	 lca(tree[x].left);
	 get(x,tree[x].left);
	 root[getroot(x)]:=x;
     end;
     if tree[x].right<>-1 then begin
	 lca(tree[x].right);
	 get(x,tree[x].right);
	 root[getroot(x)]:=x;
     end;
     flag[x]:=false;
     for i:=1 to q[x].num do
	if not flag[q[x].f[i]] then writeln(x,'  ',q[x].f[i],'  ',s[root[getroot(q[x].f[i])]]);
 end;

begin
    assign(input,'rmq.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
	read(s[i]);
	q[i].num:=0;
    end;
    readln(m);
    for i:=1 to m do begin
	readln(x,y);
	inc(q[x].num);
	q[x].f[q[x].num]:=y;
	inc(q[y].num);
	q[y].f[q[y].num]:=x;
    end;
    close(input);
    treeroot:=creattree;
    assign(output,'rmq.out'); rewrite(output);
    fillchar(a,sizeof(a),255);
    fillchar(flag,sizeof(flag),true);
    lca(treeroot);
    close(output);
end.
