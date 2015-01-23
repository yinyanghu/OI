program p1160;
const maxn=300000;
type point=^node;
     node=record
         key,pri,times,size:longint;
         l,r:point;
     end;
var root,nullnode:point;
    a,b,total,l,n,i:longint;

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

procedure insert(var p:point; x:longint);
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

procedure delete(var p:point; x:longint);
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

{function select(p:point; k:longint):longint;
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
}
function select(var p:point; x:longint):longint;
 var w:longint;
 begin
     if p<>nullnode then begin
         if p^.r=nil then w:=0 else w:=p^.r^.size;
         if x<=w then exit(select(p^.r,x));
         if (x>w) and (x<=w+p^.times) then exit(p^.key);
         exit(select(p^.l,x-w-p^.times));
     end;
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

begin
    initialize; randomize;
    readln(n); total:=1;
    for i:=1 to n do begin
        readln(a,b);
        if a>total then a:=total;
        if a=1 then begin
           writeln('facer');
           inc(total);
           insert(root,b);
        end else begin
            dec(a);
            l:=select(root,a);
            if l>b then begin
               writeln('facer');
               inc(total);
               insert(root,b);
            end else begin
                writeln('archer');
                dec(total);
                delete(root,l);
	    end;
        end;
    end;
end.
