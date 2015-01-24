{$inline on}
program Treap;
const maxn=100000;
type point=^node;
     node=record
         key,pri,times,size:longint;
         l,r:point;
     end;

var root,nullnode:point;
    n:longint;
    a,b:array[1..maxn] of longint;

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

function find(var p:point; x:longint):boolean;inline;
 begin
     if p=nullnode then exit(false);
     if x<p^.key then exit(find(p^.l,x));
     if x>p^.key then exit(find(p^.r,x));
     if x=p^.key then exit(true);
 end;

function rank(p:point; x:longint):longint;inline;
 var total:longint;
 begin
     total:=0;
     while p<>nullnode do begin
         if x<p^.key then p:=p^.l
           else begin
               inc(total,p^.l^.size);
               if p^.key=x then begin
                   inc(total);
                   break;
               end else total:=total+p^.times;
               p:=p^.r;
           end;
     end;
     rank:=total;
 end;

function maximum(p:point):longint;inline;
 begin
     while p^.r<>nullnode do p:=p^.r;
     maximum:=p^.key;
 end;

function minimum(p:point):longint;inline;
 begin
     while p^.l<>nullnode do p:=p^.l;
     minimum:=p^.key;
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

function pred(p:point; v:longint):longint;inline;
  begin
      if p=nullnode then exit(v);
      if v<=p^.key then pred:=pred(p^.l,v)
        else begin
            pred:=pred(p^.r,v);
            if pred=v then pred:=p^.key;
        end;
  end;

function succ(p:point; v:longint):longint;inline;
 begin
      if p=nullnode then exit(v);
      if p^.key<=v then succ:=succ(p^.r,v)
        else begin
            succ:=succ(p^.l,v);
            if succ=v then succ:=p^.key;
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
     randomize;
     for i:=1 to n do
       case a[i] of
           1:insert(root,b[i]);
           2:delete(root,b[i]);
           3:writeln(find(root,b[i]));
           4:writeln(rank(root,b[i]));
           5:writeln(select(root,b[i]));
           6:writeln(pred(root,b[i]));
           7:writeln(succ(root,b[i]));
           8:writeln(maximum(root));
           9:writeln(minimum(root));
       end;
 end;

begin
    assign(input,'treap.in'); reset(input);
    assign(output,'treap.out'); rewrite(output);
    init;
    main;
    close(input);
    close(output);
end.