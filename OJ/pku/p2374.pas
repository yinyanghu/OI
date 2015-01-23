program p2374;
const
	maxn = 50000;
	limitsize = 1000000;
	infinity = 200000;
	root = 1;
type
	node = record
		a,b:longint;
	end;
	treenode = record
		left,right,key,flag:array[1..limitsize] of longint;
	end;
var
	fence:array[1..maxn] of node;
	left,right,leftdown,rightdown:array[1..maxn] of longint;
	tree:treenode;
	n,start,i,x,ans,limitleft,limitright:longint;
function min(a,b:longint):longint;
 begin
	if a < b then min:=a else min:=b;
 end;

procedure buildtree(k,l,r:longint);
 var
	mid:longint;
 begin
	tree.left[k]:=l; tree.right[k]:=r; tree.key[k]:=0; tree.flag[k]:=0;
	if l + 1 = r then exit;
	mid:=(l + r) shr 1;
	buildtree(k * 2,l,mid);
	buildtree(k * 2 + 1,mid,r);
 end;

procedure updata(k:longint);
 begin
	if (tree.flag[k * 2] = tree.flag[k * 2 + 1]) then tree.flag[k]:=tree.flag[k * 2] else tree.flag[k]:=-1;
 end;

procedure modify(k,l,r,x:longint);
 var
	mid:longint;
 begin
	if (tree.left[k] = l) and (tree.right[k] = r) then begin
		tree.flag[k]:=x;
		exit;
	end;
	mid:=(tree.left[k] + tree.right[k]) shr 1;
	if (r <= mid) then modify(k * 2,l,r,x)
		else if (l >= mid) then modify(k * 2 + 1,l,r,x)
			else begin
				modify(k * 2,l,mid,x);
				modify(k * 2 + 1,mid,r,x);
			end;
	updata(k);
 end;

function find(k,x:longint):longint;
 var
 	mid:longint;
 begin
	if (tree.left[k] = x) and (tree.right[k] = x + 1) then exit(tree.key[k]);
	if (tree.flag[k] <> -1) then begin
		tree.key[k * 2]:=tree.flag[k];
		tree.key[k *2 + 1]:=tree.flag[k];
		tree.flag[k * 2]:=tree.flag[k];
		tree.flag[k * 2 + 1]:=tree.flag[k];
	end;
	mid:=(tree.left[k] + tree.right[k]) shr 1;
	if (x < mid) then find:=find(k * 2,x) else find:=find(k * 2 + 1,x);
 end;

begin
	readln(n,start);
	limitleft:=infinity; limitright:=-infinity;
	for i:=1 to n do begin
		readln(fence[i].a,fence[i].b);
		if (fence[i].a < limitleft) then limitleft:=fence[i].a;
		if (fence[i].b > limitright) then limitright:=fence[i].b;
	end;
	buildtree(root,1,limitright - limitleft + 2);
	leftdown[1]:=0; rightdown[1]:=0;
	for i:=2 to n do begin
		modify(root,fence[i - 1].a - limitleft + 1,fence[i - 1].b - limitleft + 2,i - 1);
		leftdown[i]:=find(root,fence[i].a - limitleft + 1);
		rightdown[i]:=find(root,fence[i].b - limitleft + 1);
	end;
	fillchar(left,sizeof(left),0);
	fillchar(right,sizeof(right),0);
	for i:=1 to n do begin
		x:=leftdown[i];
		if (x = 0) then left[i]:=abs(fence[i].a)
			else left[i]:=min(abs(fence[i].a - fence[x].a) + left[x],abs(fence[i].a - fence[x].b) + right[x]);
		x:=rightdown[i];
		if (x = 0) then right[i]:=abs(fence[i].b)
			else right[i]:=min(abs(fence[i].b - fence[x].a) + left[x],abs(fence[i].b - fence[x].b) + right[x]);
	end;
	ans:=min(left[n] + abs(start - fence[n].a),right[n] + abs(start - fence[n].b));
	writeln(ans);
end.

	{for i:=1 to n do begin
		leftdown[i]:=0;
		for j:=i - 1 downto 1 do
			if (fence[j].a <= fence[i].a) and (fence[j].b >= fence[i].a) then begin
				leftdown[i]:=j;
				break;
			end;
		rightdown[i]:=0;
		for j:=i - 1 downto 1 do
			if (fence[j].b >= fence[i].b) and (fence[j].a <= fence[i].b) then begin
				rightdown[i]:=j;
				break;
			end;
	end;}