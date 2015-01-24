program splay;
const
	maxn = 20000;
	infinity = 1000000000;
type
	treenode = record
		left,right,father,count:longint;
		key:longint;
	end;
var
	tree:array[0..maxn] of treenode;
	root,top:longint;

procedure initialize;
 begin
 	root:=0; top:=0;
 	with tree[0] do begin
 		left:=0; right:=0; father:=0; count:=0;
 	end;
 end;

procedure left_rotate(x:longint);
 var
 	y,z:longint;
 begin
 	y:=tree[x].father; z:=tree[x].left;
 	if (y = tree[tree[y].father].left) then tree[tree[y].father].left:=x
 		else tree[tree[y].father].right:=x;
 	
 	tree[x].father:=tree[y].father;
 	tree[x].left:=y;
 	tree[y].right:=z;
 	tree[y].father:=x;
 	tree[z].father:=y;
 	
 	//updata(y); updata(x);
 end;
 
procedure right_rotate(x:longint);
 var
 	y,z:longint;
 begin
 	y:=tree[x].father; z:=tree[x].right;
 	if (y = tree[tree[y].father].left) then tree[tree[y].father].left:=x
 		else tree[tree[y].father].right:=x;
 	
 	tree[x].father:=tree[y].father;
 	tree[x].right:=y;
 	tree[y].left:=z;
 	tree[y].father:=x;
 	tree[z].father:=y;
 	
 	//updata(y); updata(x);
 end;

procedure splay(x:longint; var root:longint);
 var
 	y,z:longint;
 begin
 	while (tree[x].father > 0) do begin
 		y:=tree[x].father;
 		z:=tree[y].father;
 		if (z = 0) then begin
 			if (x = tree[y].left) then right_rotate(x) else left_rotate(x);
 		end else begin
 			if (x = tree[y].left) then begin
 				if (y = tree[z].left) then begin
 					right_rotate(y);
 					right_rotate(x);
 				end else begin
 					right_rotate(x);
 					left_rotate(x);
 				end;
 			end else begin
 				if (y = tree[z].left) then begin
 					left_rotate(x);
 					right_rotate(x);
 				end else begin
 					left_rotate(y);
 					left_rotate(x);
 				end;
 			end;
 		end;
 	end;
 	root:=x;
 end;

function find(t:longint; key:longint):longint;
 begin
 	while (tree[t].key <> key) do
 		if (key < tree[t].key) then begin
 			if (tree[t].left = 0) then break;
 			t:=tree[t].left;
 		end else begin
 			if (tree[t].right = 0) then break;
 			t:=tree[t].right;
 		end;
 	find:=t;
 end;

procedure insert(key:longint; var root:longint);
 begin
 	inc(top);
 	tree[top].key:=key; tree[top].count:=1;
 	tree[top].left:=0; tree[top].right:=0; tree[top].father:=0;
 	if (root = 0) then begin
 		root:=top;
 		exit;
 	end;
 	splay(find(root,key),root);
 	if (tree[root].key = key) then begin
 		inc(tree[root].count);
 		exit;
 	end;
 	if (key < tree[root].key) then begin
 		tree[top].left:=tree[root].left;
 		if (tree[top].left <> 0) then tree[tree[top].left].father:=top;
 		tree[root].left:=0;
 		tree[top].right:=root;
 	end else begin
 		tree[top].right:=tree[root].right;
 		if (tree[top].right <> 0) then tree[tree[top].right].father:=top;
 		tree[root].right:=0;
 		tree[top].left:=root;
 	end;
 	tree[root].father:=top;
 	root:=top;
 end;

procedure delete(key:longint; var root:longint);
 var
 	t:longint;
 begin
 	t:=find(root,key);
 	if (key <> tree[t].key) then exit;
 	if (tree[t].count > 1) then begin
 		dec(tree[t].count);
 		exit;
 	end;
 	splay(t,root);
 	if (tree[t].left = 0) then begin
 		root:=tree[t].right;
 		tree[root].father:=0;
 	end else begin
 		tree[tree[t].left].father:=0;
 		root:=find(tree[t].left,infinity);
 		splay(root,root);
 		tree[root].right:=tree[t].right;
 		tree[tree[root].right].father:=root;
 	end;
 end;

function minimum(var root:longint):longint;
 begin
 	splay(find(root,-infinity),root);
 	minimum:=tree[root].key;
 end;

function maximum(var root:longint):longint;
 begin
 	splay(find(root,infinity),root);
 	maximum:=tree[root].key;
 end;

function prev(var root:longint; key:longint):longint;
 var
	p:longint;
 begin
	p:=find(root,key);
	splay(p,root);
	if (tree[p].left = 0) then exit(tree[p].key);
	p:=tree[p].left;
	prev:=maximum(p);
 end;

function succ(var root:longint; key:longint):longint;
 var
	p:longint;
 begin
	p:=find(root,key);
	splay(p,root);
	if (tree[p].right = 0) then exit(tree[p].key);
	p:=tree[p].right;
	succ:=minimum(p);
 end;

function exist(key:longint):boolean;
 begin
 	exist:=tree[find(root,key)].key = key;
 end;

function join(s1,s2:longint):longint;
 begin
	if (s1 = 0) then exit(s2);
	if (s2 = 0) then exit(s1);
	maximum(s1);
	
 end;

procedure main;
 var
 	n,i,k,key:longint;
 begin
 	readln(n);
 	for i:=1 to n do begin
 		read(k);
 		if (k <= 3) or (k = 6) or (k = 7) then begin
 			readln(key);
 			if (k = 1) then insert(key,root);
 			if (k = 2) then delete(key,root);
 			if (k = 3) then writeln(exist(key));
			if (k = 6) then writeln(prev(root,key));
			if (k = 7) then writeln(succ(root,key));
 		end else begin
 			if (k = 8) then writeln(maximum(root));
 			if (k = 9) then writeln(minimum(root));
 			readln;
 		end;
 	end;
 end;

begin
	initialize;
	assign(input,'bst.in'); reset(input);
	assign(output,'splay.out'); rewrite(output);
	main;
	close(input);
	close(output);
end.
