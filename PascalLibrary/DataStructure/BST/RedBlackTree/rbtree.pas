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

procedure l_rotate(var t:point);
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

procedure r_rotate(var t:point);
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

procedure insert(t:longint);
 var x,y,z,zpp:point;
 begin
     new(z);
     z^.key:=t; z^.l:=nullnode; z^.r:=nullnode; z^.color:=true; z^.count:=1;
     y:=nullnode;
     x:=root;
     while x<>nullnode do begin
	 y:=x;
	 if z^.key<x^.key then x:=x^.l else 
	    if z^.key>x^.key then x:=x^.r else begin
		inc(x^.count); exit;
            end;
     end;
     z^.p:=y;
     if y=nullnode then root:=z
	else if z^.key<y^.key then y^.l:=z
	   else y^.r:=z;
      while (z<>root) and (z^.p^.color) do begin
         zpp:=z^.p^.p;
         if (z^.p=zpp^.l) then begin
            y:=zpp^.r;
            if (y<>nullnode) and (y^.color) then begin
               z^.p^.color:=false;
               y^.color:=false;
               zpp^.color :=true;
               z:=zpp;
            end else begin
                if (z=z^.p^.r) then begin
                    z:=z^.p;
                    l_rotate(z);
                end;
                z^.p^.color:=false;
                zpp^.color:=true;
                r_rotate(zpp);
            end;
         end else begin
             y:=zpp^.l;
             if (y<>nullnode) and (y^.color) then begin
                z^.p^.color :=false;
                y^.color:=false;
                zpp^.color:=true;
                z:=zpp;
             end else begin
                 if (z=z^.p^.l) then begin
                     z:=z^.p;
                     r_rotate(z);
                 end;
                 z^.p^.color:=false;
                 zpp^.color:=true;
                 l_rotate(zpp);
             end;
         end;
     end;
     root^.color:=false;
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

procedure delete(t:longint);
 var x,y,z,w:point;
     tmpcol:boolean;
 begin
     z:=root;
     while (z<>nullnode) do begin
	 if t<z^.key then z:=z^.l
	    else if t=z^.key then break
	 	else z:=z^.r;
     end;
    { if z^.count>1 then begin
	 dec(z^.count);
	 exit;
     end;}
     y:=z; x:=nullnode;
     x^.p:=nullnode;
     if y^.l=nullnode then x:=y^.r
       else begin
	   if (y^.r=nullnode) then begin
	      x:=y^.l;
	   end else begin
	       y:=y^.r;
	       while (y^.l<>nullnode) do y:=y^.l;
	       x:=y^.r;
	   end;
       end;

     if (y<>z) then begin
        z^.l^.p:=y;
        y^.l:=z^.l;
        if (y<>z^.r) then begin
            x^.p:=y^.p;
            if (x<>nullnode) then begin
                x^.p:=y^.p;
            end;
            y^.p^.l:=x;   
            y^.r:=z^.r;
            z^.r^.p:=y;
        end else begin
            x^.p:=y;
        end;
        if (root=z) then begin
           root:=y;
        end else if (z^.p^.l=z) then begin
           z^.p^.l:=y;
        end else begin
            z^.p^.r:=y;
        end;
        y^.p:=z^.p;
        tmpcol:=y^.color;
        y^.color:=z^.color;
        z^.color:=tmpcol;
        y:=z;
     end else begin                        
         x^.p:=y^.p;
         if (x<>nullnode) then begin
             x^.p:=y^.p;
         end;
         if (root=z) then begin
            root:=x;
         end else begin
             if (z^.p^.l=z) then begin
                z^.p^.l:=x;
             end else begin
                 z^.p^.r:=x;
             end;
         end;
     end;
     if (y^.color = false)  then begin
    while ((x <> root) and ((x = nullnode) or (x^.color = false))) do begin
      if (x = x^.p^.l)  then begin
          w := x^.p^.r;
          if (w^.color = true)  then begin
            w^.color := false;
            x^.p^.color := true;
            l_rotate(x^.p);
            w := x^.p^.r;
          end;
          if (((w^.l = nullnode) or
               (w^.l^.color = false)) and
              ((w^.r = nullnode) or
               (w^.r^.color = false)))  then begin
            w^.color := true;
            x := x^.p;
            x^.p := x^.p^.p;
          end else begin
            if ((w^.r = nullnode) or (w^.r^.color = false)) then begin
              w^.l^.color := false;
              w^.color := true;
              r_rotate(w);
              w := x^.p^.r;
            end;
            w^.color := x^.p^.color;
            x^.p^.color := false;
            if (w^.r <> nullnode)  then begin
              w^.r^.color := false;
            end;
            l_rotate(x^.p);
            x := root; 
         end
      end else begin
        w := x^.p^.l;
        if (w^.color = true)  then begin
          w^.color := false;
          x^.p^.color := true;
          r_rotate(x^.p);
          w := x^.p^.l;
        end;
        if (((w^.r = nullnode) or
             (w^.r^.color = false)) and
            ((w^.l = nullnode) or
             (w^.l^.color = false)))  then begin
          w^.color := true;
          x := x^.p;
          x^.p := x^.p^.p;
        end else begin
          if ((w^.l = nullnode) or (w^.l^.color = false)) then begin
            w^.r^.color := false;
            w^.color := true;
            l_rotate(w);
            w := x^.p^.l;
          end;
          w^.color := x^.p^.color;
          x^.p^.color := false;
          if (w^.l <> nullnode) then begin
            w^.l^.color := false;
          end;
          r_rotate(x^.p);
          x := root; 
        end;
      end;
    end;
    if (x <> nullnode) then begin
      x^.color := false;
    end;
  end;
  dispose(y);
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
           3:writeln(find(b[i])<>nullnode);
           //4:writeln(rank(root,b[i]));
           //5:writeln(select(root,b[i]));
           6:writeln(pred(b[i])^.key);
           7:writeln(succ(b[i])^.key);
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
