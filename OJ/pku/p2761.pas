{$inline on}
program p2761;
type data=record
	 x,y,k,num:longint;
     end;
     point=^node;
     node=record
         key,pri,times,size:longint;
         l,r:point;
     end;
const maxn=100000;
      maxm=50000;
var a:array[0..maxm] of data;
    c:array[1..maxn] of longint;
    ans:array[1..maxm] of longint;
    root,nullnode:point;
    n,m:longint;

procedure updata(var p:point);inline;
 begin
     p^.size:=p^.l^.size+p^.r^.size+p^.times;
 end;

procedure left_rotate(var p:point);inline;
 var temp:point;
 begin
     temp:=p^.l;
     p^.l:=temp^.r;
     temp^.r:=p;
     updata(p); updata(temp);
     p:=temp;
 end;

procedure right_rotate(var p:point);inline;
 var temp:point;
 begin
     temp:=p^.r;
     p^.r:=temp^.l;
     temp^.l:=p;
     updata(p); updata(temp);
     p:=temp;
 end;

procedure insert(var p:point; x:longint);inline;
 begin
     if p=nullnode then begin
         new(p);
         p^.key:=x;
         p^.pri:=random(maxint);
         p^.times:=1;
         p^.size:=1;
         p^.l:=nullnode; p^.r:=nullnode;
         exit;
     end;
     if x=p^.key then inc(p^.times);
     if x<p^.key then begin
         insert(p^.l,x);
         if p^.l^.pri<p^.pri then left_rotate(p);
     end;
     if x>p^.key then begin
         insert(p^.r,x);
         if p^.r^.pri<p^.pri then right_rotate(p);
     end;
     updata(p);
 end;

procedure delete(var p:point; x:longint);inline;
 begin
     if p=nullnode then exit;
     dec(p^.size);
     if x<p^.key then begin
         delete(p^.l,x);
         exit;
     end;
     if x>p^.key then begin
         delete(p^.r,x);
         exit;
     end;
     if p^.times>1 then
         dec(p^.times)
     else if (p^.l=nullnode) and (p^.r=nullnode) then begin
             dispose(p);
             p:=nullnode;
          end else
              if p^.r=nullnode then begin
                 left_rotate(p);
                 delete(p,x);
              end else
                  if p^.l^.pri<p^.r^.pri then begin
                     left_rotate(p);
                     delete(p,x);
                  end else begin
                      right_rotate(p);
                      delete(p,x);
                  end;
     updata(p);
 end;

function select(p:point; k:longint):longint;inline;
 begin
     while p<>nullnode do
	if k<=p^.l^.size then p:=p^.l
	   else begin
	       dec(k,p^.l^.size);
	       if k<=p^.times then break;
	       dec(k,p^.times);
	       p:=p^.r;
	   end;
     select:=p^.key;
 end;

procedure initialize;
 begin
     new(nullnode);
     nullnode^.pri:=maxint;
     nullnode^.times:=0;
     nullnode^.size:=0;
     nullnode^.l:=nullnode;
     nullnode^.r:=nullnode;
     root:=nullnode;
 end;

procedure qsort(l,r:longint);
 var i,j,k:longint;
     p:data;
 begin
     i:=l; j:=r; k:=a[(l+r) div 2].x;
     repeat
        while a[i].x<k do inc(i);
        while a[j].x>k do dec(j);
	if i<=j then begin
	    p:=a[i]; a[i]:=a[j]; a[j]:=p;
            inc(i); dec(j);
	end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

procedure init;
 var i:longint;
 begin
     readln(n,m);
     for i:=1 to n do read(c[i]);
     for i:=1 to m do begin
	 readln(a[i].x,a[i].y,a[i].k);
         a[i].num:=i;
     end;
     qsort(1,m);
     a[0].x:=a[1].x; a[0].y:=a[1].x-1;
 end;

procedure main;
 var i,j:longint;
 begin
     initialize;
     randomize;
     for i:=1 to m do begin
         for j:=a[i-1].x to a[i].x-1 do delete(root,c[j]);
         for j:=a[i-1].y+1 to a[i].y do insert(root,c[j]);
         ans[a[i].num]:=select(root,a[i].k);
     end;
     for i:=1 to m do writeln(ans[i]);
 end;

begin
    init;
    main;
end.