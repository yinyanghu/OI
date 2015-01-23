program p1160;
const maxn=300000;
type point=^node;
     node=record
	 key,count,size:longint;
         l,r:point;
     end;
var nullnode,root:point;

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

function select(var p:point; x:longint):longint;
 var w:longint;
 begin
     if p<>nullnode then begin
         if p^.r=nil then w:=0 else w:=p^.r^.size;
         if x<=w then exit(select(p^.r,x));
         if (x>w) and (x<=w+p^.count) then exit(p^.key);
         exit(select(p^.l,x-w-p^.count));
     end;
 end;

procedure main;
 var i,n,a,b,total,l:longint;
 begin
     initialize;
     readln(n); total:=1;
     for i:=1 to n do begin
	 readln(a,b);
         if a>total then a:=total;
         if a=1 then begin
            writeln('facer');
            inc(total);
            insert(b);
         end else begin
            dec(a);
            l:=select(root,a);
            if l>b then begin
                writeln('facer');
                inc(total);
                insert(b);
             end else begin
                 writeln('archer');
                 dec(total);
                 delete(l);
	     end;
         end;
     end;
 end;

begin
    assign(input,'test.in'); reset(input);
    assign(output,'test.out'); rewrite(output);
    main;
    close(input);
    close(output);
end.
