program stone4;
type point=^node;
     node=record
         s,t,c:longint;
         l,r:point;
     end;
var head:point;
    i,m,n,t,x,y,color:longint;
procedure build(var p:point; l,r:longint);
 var mid:longint;
     w1,w2:point;
 begin
     new(p);
     p^.s:=l; p^.t:=r; p^.c:=0;
     if l+1<=r then begin
        mid:=(l+r) div 2;
        build(w1,l,mid);
        p^.l:=w1;
        build(w2,mid+1,r);
        p^.r:=w2;
     end else begin
         p^.l:=nil;
         p^.r:=nil;
     end;
 end;

procedure modify(var p:point; x,y,color:longint);
 var mid:longint;
 begin
     if ((p^.s=x) and (p^.t=y)) or (p^.c=color) then begin
         p^.c:=color;
         exit;
     end;
     if p^.c<>-1 then begin
         p^.l^.c:=p^.c;
         p^.r^.c:=p^.c;
         p^.c:=-1;
     end;
     mid:=(p^.s+p^.t) div 2;
     if y<=mid then modify(p^.l,x,y,color)
        else if x>=mid+1 then modify(p^.r,x,y,color)
            else begin
 		modify(p^.l,x,mid,color);
      	        modify(p^.r,mid+1,y,color);
            end;
     if p^.l^.c=p^.r^.c then p^.c:=p^.l^.c;
 end;

function getsum(p:point; color:longint):longint;
 begin
     if p^.c<>-1 then begin
         if p^.c=color then exit(p^.t-p^.s+1);
         exit(0);
     end;
     getsum:=getsum(p^.l,color)+getsum(p^.r,color);
 end;

begin
    assign(input,'stone4.in'); reset(input);
    assign(output,'stone4.out'); rewrite(output);
    readln(n,t,m);
    build(head,1,n);
    for i:=1 to m do begin
        readln(x,y,color);
        modify(head,x,y,color);
    end;
    for i:=1 to t do writeln(getsum(head,i));
    close(input);
    close(output);
end.