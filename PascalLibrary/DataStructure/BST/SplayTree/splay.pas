program splaytree;
const maxn=50000;
type point=^node;
     node=record
	 key,count,size:longint;
         l,r:point;
     end;
var nullnode,root:point;
    n:longint;
    a,b:array[1..maxn] of longint;

procedure initialize;
 begin
     new(nullnode);
     nullnode^.key:=0;
     nullnode^.count:=0;
     nullnode^.size:=0;
     nullnode^.l:=nullnode;
     nullnode^.r:=nullnode;
     root:=nullnode;
 end;
procedure updata(var p:point);
 begin
     p^.size:=p^.l^.size+p^.r^.size+p^.count;
 end;

procedure left_rotate(var p:point);
 var temp:point;
 begin
     temp:=p^.l;
     p^.l:=temp^.r;
     temp^.r:=p;
     updata(p); updata(temp);
     p:=temp;
 end;

procedure right_rotate(var p:point);
 var temp:point;
 begin
     temp:=p^.r;
     p^.r:=temp^.l;
     temp^.l:=p;
     updata(p); updata(temp);
     p:=temp;
 end;

procedure splay(var p:point; x:longint);
 begin
     if x<p^.key then begin
        if p^.l<>nullnode then begin
	    splay(p^.l,x);
             left_rotate(p);
	end;
     end else begin
         if x>p^.key then begin
	     if p^.r<>nullnode then begin
	 	 splay(p^.r,x);
	 	 right_rotate(p);
	     end;
         end;
     end;
     updata(p);
 end;

procedure insert(x:longint);
 var p:point;
 begin
     splay(root,x);
     if x<root^.key then begin
	new(p);
	p^.key:=x;
	p^.count:=1;
	p^.l:=root^.l;
         root^.l:=nullnode;
         updata(root);
	p^.r:=root;
	root:=p;
     end else begin
         if x>root^.key then begin
	   new(p);
	   p^.key:=x;
	   p^.count:=1;
	   p^.r:=root^.r;
            root^.r:=nullnode;
	   updata(root);
	   p^.l:=root;
	   root:=p;
         end else inc(root^.count);
     end;
     updata(root);
 end;

procedure delete(x:longint);
 var p:point;
 begin
     splay(root,x);
     if x=root^.key then
        if root^.count>1 then dec(root^.count)
           else begin
	       if root^.l=nullnode then p:=root^.r
		  else begin
		      p:=root^.l;
		      splay(p,x);
		      p^.r:=root^.r;
		  end;
	       dispose(root);
	       root:=p;
	   end;
     updata(root);
 end;

function find(x:longint):boolean;
 begin
     splay(root,x);
     find:=root^.key=x;
 end;

function rank(x:longint):longint;
 begin
     splay(root,x);
     rank:=root^.l^.size+1;
 end;

function select(k:longint):longint;
 var p:point;
 begin
     p:=root;
     while p<>nullnode do
	if k<=p^.l^.size then p:=p^.l
	   else begin
	       dec(k,p^.l^.size);
	       if k<=p^.count then break;
	       dec(k,p^.count);
	       p:=p^.r;
	   end;
     splay(root,p^.key);
     select:=p^.key;
 end;

function minimum:longint;
 begin
     splay(root,-maxlongint);
     exit(root^.key);
 end;

function maximum:longint;
 begin
     splay(root,maxlongint);
     exit(root^.key);
 end;

function pred(p:point; x:longint):longint;
 begin
     if p=nullnode then exit(x);
     if x<=p^.key then pred:=pred(p^.l,x)
       else begin
           pred:=pred(p^.r,x);
           if pred=x then pred:=p^.key;
       end;
 end;

function succ(p:point; x:longint):longint;
 begin
     if p=nullnode then exit(x);
     if p^.key<=x then succ:=succ(p^.r,x)
       else begin
           succ:=succ(p^.l,x);
           if succ=x then succ:=p^.key;
       end;
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
           2:delete(b[i]);
           3:writeln(find(b[i]));
           4:writeln(rank(b[i]));
           5:writeln(select(b[i]));
           6:writeln(pred(root,b[i]));
           7:writeln(succ(root,b[i]));
           8:writeln(maximum);
           9:writeln(minimum);
       end;
 end;

begin
    assign(input,'splay.in'); reset(input);
    assign(output,'splay.out'); rewrite(output);
    init;
    main;
    close(input);
    close(output);
end.