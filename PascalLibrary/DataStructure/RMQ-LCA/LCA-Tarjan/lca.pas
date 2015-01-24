program lcatarjan;
const maxn=10000; //节点个数
      maxm=100;
type treenode=record
	 left,right:longint;
     end;
     setnode=record
	 rank,f:longint;
     end;
     asknode=record
	 num:longint;
	 f:array[1..maxm] of longint;
     end;
var root:array[1..maxn] of longint;
    a:array[1..maxn] of setnode;
    tree:array[1..maxn] of treenode;
    q:array[1..maxn] of asknode;
    flag:array[1..maxn] of boolean;
    i,m,n,x,y,treeroot:longint;
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
	if not flag[q[x].f[i]] then writeln(x,'  ',q[x].f[i],'  ',root[getroot(q[x].f[i])]);
 end;

begin
    assign(input,'lca.in'); reset(input);
    readln(n,treeroot);
    for i:=1 to n do begin
	readln(tree[i].left,tree[i].right);
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
    assign(output,'lca.out'); rewrite(output);
    fillchar(a,sizeof(a),255);
    fillchar(flag,sizeof(flag),true);
    lca(treeroot);
    close(output);
end.
