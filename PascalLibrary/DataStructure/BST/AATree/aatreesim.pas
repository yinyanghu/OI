program aatree;
const maxn=100000;
type tree=^node;
     node=record
	 left,right:tree;
	 level,key:longint;
     end;
var nullnode,deleted,last,root:tree;
    n:longint;
    a,b:array[1..maxn] of longint;
procedure initglobalvariables;
 begin
     new(nullnode);
     nullnode^.level:=0;
     nullnode^.left:=nullnode;
     nullnode^.right:=nullnode;
     deleted:=nullnode;
     last:=nullnode;
     root:=nullnode;
 end;

procedure skew(var t:tree);
 var temp:tree;
 begin
     if t^.left^.level=t^.level then begin
	 temp:=t; t:=t^.left; temp^.left:=t^.right; t^.right:=temp;
     end;
 end;

procedure split(var t:tree);
 var temp:tree;
 begin
     if t^.right^.right^.level=t^.level then begin
	 temp:=t; t:=t^.right; temp^.right:=t^.left; t^.left:=temp; t^.level:=t^.level+1;
     end;
 end;

procedure insert(var x:longint; var t:tree);
 begin
     if t=nullnode then begin
	new(t);
	t^.key:=x;
	t^.left:=nullnode;
	t^.right:=nullnode;
	t^.level:=1;
     end else begin
	 if x<t^.key then insert(x,t^.left)
	    else insert(x,t^.right);
	 skew(t); split(t);
     end;
 end;

procedure delete(var x:longint; var t:tree);
 begin
     if t<>nullnode then begin
	 last:=t;
	 if x<t^.key then delete(x,t^.left)
	     else begin
		 deleted:=t;
		 delete(x,t^.right);
	     end;
	 if (t=last) and (deleted<>nullnode) and (x=deleted^.key) then begin
	     deleted^.key:=t^.key;
	     deleted:=nullnode;
	     t:=t^.right;
	     dispose(last);
	 end else if (t^.left^.level<t^.level-1) or (t^.right^.level<t^.level-1) then begin
	     dec(t^.level);
	     if t^.right^.level>t^.level then t^.right^.level:=t^.level;
	     skew(t); skew(t^.right);
	     skew(t^.right^.right);
	     split(t); split(t^.right);
	 end;
     end;
 end;

function find(x:longint; var p:tree):boolean;
 begin
     if p=nullnode then exit(false);
     if x<p^.key then exit(find(x,p^.left));
     if x>p^.key then exit(find(x,p^.right));
     if x=p^.key then exit(true);
 end;

function pred(p:tree; v:longint):longint;
  begin
      if p=nullnode then exit(v);
      if v<=p^.key then pred:=pred(p^.left,v)
        else begin
            pred:=pred(p^.right,v);
            if pred=v then pred:=p^.key;
        end;
  end;

function succ(p:tree; v:longint):longint;
 begin
      if p=nullnode then exit(v);
      if p^.key<=v then succ:=succ(p^.right,v)
        else begin
            succ:=succ(p^.left,v);
            if succ=v then succ:=p^.key;
        end;
  end;

function maximum(p:tree):longint;
 begin
     while p^.right<>nullnode do p:=p^.right;
     maximum:=p^.key;
 end;

function minimum(p:tree):longint;
 begin
     while p^.left<>nullnode do p:=p^.left;
     minimum:=p^.key;
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
     initglobalvariables;
     for i:=1 to n do
       case a[i] of
           1:insert(b[i],root);
           2:delete(b[i],root);
           3:writeln(find(b[i],root));
           //4:writeln(rank(root,b[i]));
           //5:writeln(select(root,b[i]));
           6:writeln(pred(root,b[i]));
           7:writeln(succ(root,b[i]));
           8:writeln(maximum(root));
           9:writeln(minimum(root));
       end;
 end;

begin
    assign(input,'aatree.in'); reset(input);
    assign(output,'aatree.out'); rewrite(output);
    init;
    main;
    close(input);
    close(output);
end.