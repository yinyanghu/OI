program redblacktree;
type point=^node;
     node=record
	 key,count:longint;
	 p,l,r:point;
	 color:boolean;
     end;
const maxn=1000;
var root,nullnode:point;
    n:longint;
    a,b:array[1..maxn] of longint;

procedure initialize;
 begin
     new(nullnode);
     nullnode^.key:=0;
     nullnode^.count:=0;
     nullnode^.p:=nullnode;
     nullnode^.l:=nullnode;
     nullnode^.r:=nullnode;
     nullnode^.color:=false;
     root:=nullnode;
 end;

procedure rotate_left(t:point);
 var temp:point;
 begin
     temp:=t^.r;
     t^.r:=temp^.l;
     if temp^.l<>nullnode then temp^.l^.p:=t;
     temp^.p:=t^.p;
     if t=root then root:=temp
	else if t=t^.p^.l then t^.p^.l:=temp
	   else t^.p^.r:=temp;
     temp^.l:=t;
     t^.p:=temp;
 end;

procedure rotate_right(t:point);
 var temp:point;
 begin
     temp:=t^.l;
     t^.l:=temp^.r;
     if temp^.r<>nullnode then temp^.r^.p:=t;
     temp^.p:=t^.p;
     if t=root then root:=temp
	else if t=t^.p^.r then t^.p^.r:=temp
	   else t^.p^.l:=temp;
     temp^.r:=t;
     t^.p:=temp;
 end;

function grandparent(t:point):point;
 begin
     grandparent:=t^.p^.p;
 end;

function uncle(t:point):point;
 begin
     if t^.p=grandparent(t)^.l then uncle:=grandparent(t)^.r else uncle:=grandparent(t)^.l;
 end;

procedure insert_case5(t:point);
 begin
     t^.p^.color:=false;
     grandparent(t)^.color:=true;
     if (t=t^.p^.l) and (t^.p=grandparent(t)^.l) then rotate_right(grandparent(t))
	else rotate_left(grandparent(t));
 end;

procedure insert_case4(t:point);
 begin
     if (t=t^.p^.r) and (t^.p=grandparent(t)^.l) then begin
	rotate_left(t^.p);
	t:=t^.l;
     end else if (t=t^.p^.l) and (t^.p=grandparent(t)^.r) then begin
	 rotate_right(t^.p);
	 t:=t^.r;
     end;
     insert_case5(t);
 end;

procedure insert_case3(t:point);
 begin
     if (uncle(t)<>nullnode) and (uncle(t)^.color) then begin
	 t^.p^.color:=false;
	 uncle(t)^.color:=false;
	 grandparent(t)^.color:=true;
	 insert_case1(grandparent(t));
     end else insert_case4(t);
 end;

procedure insert_case2(t:point);
 begin
     if t^.p^.color=false then exit;
     insert_case3(t);
 end;

procedure insert_case1(t:point);
 begin
     if t^.p=nullnode then t^.color:=false else insert_case2(t);
 end;


procedure insert(t:longint);
 var p:point;
 begin
     new(p);
     p:=nullnode; p^.key:=t;
     insert_case1(p);
 end;

function find(t:longint):point;
 var q:point;
 begin
     q:=root;
     while (q<>nullnode) do begin
	 if t<q^.key then q:=q^.l
	    else if t=q^.key then break
	 	else q:=q^.r;
     end;
     find:=q;
 end;

function minimum(x:point):point;
 begin
     while x^.l<>nullnode do x:=x^.l;
     exit(x);
 end;

function maximum(x:point):point;
 begin
     while x^.r<>nullnode do x:=x^.r;
     exit(x);
 end;

function succ(t:longint):point;
 var x,y:point;
 begin
     x:=find(t);
     if x^.r<>nullnode then exit(minimum(x^.r));
     y:=x^.p;
     while (y<>nullnode) and (x=y^.r) do begin
	 x:=y;
	 y:=y^.p;
     end;
     succ:=y;
 end;

function pred(t:longint):point;
 var x,y:point;
 begin
     x:=find(t);
     if x^.l<>nullnode then exit(maximum(x^.l));
     y:=x^.p;
     while (y<>nullnode) and (x=y^.l) do begin
	 x:=y;
	 y:=y^.p;
     end;
     pred:=y;
 end;


procedure init;
 var i:longint;
 begin
     readln(n);
     for i:=1 to n do begin
         read(a[i]);
         if (a[i]<>8) and (a[i]<>9) then readln(b[i]);
     end;
 end;

procedure main;
 var i:longint;
 begin
     initialize;
     for i:=1 to n do
       case a[i] of
           1:insert(b[i]);
           //2:delete(b[i]);
           3:writeln(find(b[i])<>nullnode);
           //4:writeln(rank(root,b[i]));
           //5:writeln(select(root,b[i]));
           //6:writeln(pred(b[i])^.key);
           //7:writeln(succ(b[i])^.key);
           8:writeln(maximum(root)^.key);
           9:writeln(minimum(root)^.key);
       end;
 end;
begin
    assign(input,'rbtree.in'); reset(input);
    assign(output,'rbtree.out'); rewrite(output);
    init;
    main;
    close(input);
    close(output);
end.
