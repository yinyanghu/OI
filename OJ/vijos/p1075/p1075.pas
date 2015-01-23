program p1075;
const maxn=100000;
type data=record
         x,y:longint;
     end;
     point=^node;
     node=record
         key,pri,times,size:longint;
         l,r:point;
     end;

var root,nullnode:point;
    a:array[1..maxn] of data;
    ans:array[0..maxn] of longint;
    n:longint;

procedure init;
 var i:longint;
 begin
     readln(n);
     for i:=1 to n do readln(a[i].x,a[i].y);
 end;

procedure qsort(l,r:longint);
 var i,j,k1,k2,s:longint;
     y:data;
 begin
     i:=l; j:=r; s:=random(r-l+1)+l;
     k1:=a[s].x; k2:=a[s].y;
     repeat
	while (a[i].x<k1) or ((a[i].x=k1) and (a[i].y<k2)) do inc(i);
	while (a[j].x>k1) or ((a[j].x=k1) and (a[j].y>k2)) do dec(j);
        if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
            inc(i); dec(j);
	end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

procedure initialize;
 begin
     new(nullnode);
     nullnode^.key:=0;
     nullnode^.times:=0;
     nullnode^.size:=0;
     nullnode^.l:=nullnode;
     nullnode^.r:=nullnode;
     root:=nullnode;
 end;
procedure updata(var p:point);
 begin
     p^.size:=p^.l^.size+p^.r^.size+p^.times;
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
	 p^.times:=1;
	 p^.l:=root^.l;
         root^.l:=nullnode;
         updata(root);
	 p^.r:=root;
	 root:=p;
     end else begin
         if x>root^.key then begin
	    new(p);
	    p^.key:=x;
	    p^.times:=1;
	    p^.r:=root^.r;
            root^.r:=nullnode;
	    updata(root);
	    p^.l:=root;
	    root:=p;
         end else inc(root^.times);
     end;
     updata(root);
 end;

function rank(x:longint):longint;
 begin
     splay(root,x);
     rank:=root^.l^.size+root^.times;
 end;

procedure main;
 var i,k:longint;
 begin
     initialize;
     fillchar(ans,sizeof(ans),0);
     qsort(1,n);
     for i:=1 to n do begin
         k:=rank(a[i].y);
         inc(ans[k]);
         insert(a[i].y);
     end;
     for i:=0 to n-1 do writeln(ans[i]);
 end;

begin
    init;
    main;
end.
