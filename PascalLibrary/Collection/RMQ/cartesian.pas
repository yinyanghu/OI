program cartesian;
const maxn=10000;
type node=record
	 left,right,p:longint;
     end;
var tree:array[1..maxn] of node;
    a:array[1..maxn] of longint;
    n,i,root:longint;

function creattree:longint;
 var i,pre,root:longint;
 begin
     tree[1].p:=-1; tree[1].left:=-1; tree[1].right:=-1;
     root:=1;
     for i:=2 to n do begin
	 pre:=i-1;
	 while (a[i]>a[pre]) and (pre<>-1) do pre:=tree[pre].p;         // min heap
	 //while (a[i]<a[pre]) and (pre<>-1) do pre:=tree[pre].p;       // max heap
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

procedure print(root:longint);
 begin
     if root=-1 then exit;
     write('(');
     print(tree[root].left);
     write(a[root]);
     print(tree[root].right);
     write(')');
 end;

begin
    assign(input,'cartesian.in'); reset(input);
    readln(n);
    for i:=1 to n do read(a[i]);
    close(input);
    root:=creattree;
    assign(output,'cartesian.out'); rewrite(output);
    print(root);
    writeln;
    close(output);
end.
