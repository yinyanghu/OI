program bst;
type point=^node;
     node=record
         l,r:point;
         key,s:longint;
     end;
var head:point;
    n,i,b,total,k,m,v:longint;
procedure insert(var p:point; x:longint);
 var q:point;
 begin
     if (p=nil) then begin
         new(p);
         p^.key:=x;
         inc(total);
         p^.s:=total;
         q:=nil;
         p^.l:=q; p^.r:=q;
         exit;
     end;
     if x<=p^.key then insert(p^.l,x)
        else insert(p^.r,x);
 end;

function find(p:point; x:longint):longint;
 begin
     if x=p^.key then find:=p^.s
       else if x<p^.key then find:=find(p^.l,x)
         else find:=find(p^.r,x);
 end;

procedure inorder(p:point);
 begin
     if p^.l<>nil then inorder(p^.l);
     write(p^.key,' ');
     if p^.r<>nil then inorder(p^.r);
 end;

begin
    readln(n); total:=0;
    head:=nil;
    for i:=1 to n do begin
        read(k);
        insert(head,k);
    end;
    readln(m);
    for i:=1 to m do begin
        read(v);
        if v<>3 then readln(b);
        case v of
            1:insert(head,b);
            2:inorder(head);
            3:writeln(find(head,b));
        end;
    end;
end.