program splay;
const
	maxn = 20000;
	infinity = 1000000000;
type
	treenode = record
		left,right,father,count:longint;
		key:longint;
	end;
	tsplay = object
		root,top:longint;
		tree:array[1..maxn] of treenode;
		
		procedure initialize;
		procedure left_rotate(x:longint);
		procedure right_rotate(x:longint);
		function find(t:longint; key:longint):longint;
		procedure splay(x:longint);
		
		procedure insert(key:longint);
		procedure delete(key:longint);
		function join(x1,x2:longint):longint;
		procedure split(x:longint; var s1,s2:longint);
		
		function minimum(x:longint):longint;
		function getminimum(x:longint):longint;
		function maximum(x:longint):longint;
		function getmaximum(x:longint):longint;
		function exist(key:longint):boolean;
		function prev(key:longint):longint;
		function succ(key:longint):longint;
	end;

procedure tsplay.initialize;
 begin
 	root:=0; top:=0;
 	fillchar(tree,sizeof(tree),0);
 end;

procedure tsplay.left_rotate(x:longint);
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
 end;
 
procedure tsplay.right_rotate(x:longint);
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
 end;

procedure tsplay.splay(x:longint);
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

function tsplay.find(t:longint; key:longint):longint;
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

procedure tsplay.insert(key:longint);
 begin
 	inc(top);
 	tree[top].key:=key; tree[top].count:=1;
 	tree[top].left:=0; tree[top].right:=0; tree[top].father:=0;
 	if (root = 0) then begin
 		root:=top;
 		exit;
 	end;
 	splay(find(root,key));
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

procedure tsplay.delete(key:longint);
 var
 	t,s1,s2:longint;
 begin
 	t:=find(root,key);
 	if (key <> tree[t].key) then exit;
 	if (tree[t].count > 1) then begin
 		dec(tree[t].count);
 		exit;
 	end;
 	split(t,s1,s2);
 	root:=join(s1,s2);
 end;

function tsplay.join(x1,x2:longint):longint;
 var
 	p:longint;
 begin
	if (x1 = 0) then exit(x2);
	if (x2 = 0) then exit(x1); 
	p:=maximum(x1); tree[p].right:=x2; tree[x2].father:=p;
	join:=root;
 end;

procedure tsplay.split(x:longint; var s1,s2:longint);
 begin
 	splay(x);
 	s1:=tree[x].left; tree[s1].father:=0; tree[root].left:=0;
 	s2:=tree[x].right; tree[s2].father:=0; tree[root].right:=0;
 end;

function tsplay.minimum(x:longint):longint;
 begin
 	splay(find(x,-infinity));
 	minimum:=root;
 end;

function tsplay.maximum(x:longint):longint;
 begin
 	splay(find(x,infinity));
 	maximum:=root;
 end;

function tsplay.getmaximum(x:longint):longint;
 begin
 	getmaximum:=tree[maximum(x)].key;
 end;

function tsplay.getminimum(x:longint):longint;
 begin
 	getminimum:=tree[minimum(x)].key;
 end;

function tsplay.prev(key:longint):longint;
 var
	p:longint;
 begin
	p:=find(root,key);
	splay(p);
	if (tree[p].left = 0) then exit(tree[p].key);
	p:=tree[p].left;
	prev:=tree[maximum(p)].key;
 end;

function tsplay.succ(key:longint):longint;
 var
	p:longint;
 begin
	p:=find(root,key);
	splay(p);
	if (tree[p].right = 0) then exit(tree[p].key);
	p:=tree[p].right;
	succ:=tree[minimum(p)].key;
 end;

function tsplay.exist(key:longint):boolean;
 begin
 	exist:=tree[find(root,key)].key = key;
 end;

var
	splaytree:tsplay;

begin
	splaytree.initialize;
end.

{
procedure tsplay.delete(key:longint);
 var
 	t:longint;
 begin
 	t:=find(root,key);
 	if (key <> tree[t].key) then exit;
 	if (tree[t].count > 1) then begin
 		dec(tree[t].count);
 		exit;
 	end;
 	splay(t);
 	if (tree[t].left = 0) then begin
 		root:=tree[t].right;
 		tree[root].father:=0;
 	end else begin
 		tree[tree[t].left].father:=0;
 		root:=find(tree[t].left,infinity);
 		splay(root);
 		tree[root].right:=tree[t].right;
 		tree[tree[root].right].father:=root;
 	end;
 end;
}
 
{
	assign(input,'bst.in'); reset(input);
	assign(output,'splay.out'); rewrite(output);
	main;
	close(input);
	close(output);
}


{
	splaytree.insert(1);
	splaytree.insert(3);
	splaytree.insert(2);
	splaytree.insert(10);
	splaytree.insert(0);
	writeln(splaytree.getmaximum(splaytree.root));
	writeln(splaytree.getminimum(splaytree.root));
	
	splaytree.delete(10);
	writeln(splaytree.getmaximum(splaytree.root));
	writeln(splaytree.getminimum(splaytree.root));
	
	splaytree.delete(0);
	writeln(splaytree.getmaximum(splaytree.root));
	writeln(splaytree.getminimum(splaytree.root));
}

{
procedure main;
 var
 	n,i,k,key:longint;
 begin
 	readln(n);
 	for i:=1 to n do begin
 		read(k);
 		if (k <= 3) or (k = 6) or (k = 7) then begin
 			readln(key);
 			if (k = 1) then splaytree.insert(key);
 			if (k = 2) then splaytree.delete(key);
 			if (k = 3) then writeln(splaytree.exist(key));
			if (k = 6) then writeln(splaytree.prev(key));
			if (k = 7) then writeln(splaytree.succ(key));
 		end else begin
 			if (k = 8) then writeln(splaytree.getmaximum(splaytree.root));
 			if (k = 9) then writeln(splaytree.getminimum(splaytree.root));
 			readln;
 		end;
 	end;
 end;
}