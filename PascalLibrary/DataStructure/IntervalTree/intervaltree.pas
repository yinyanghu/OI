program intervaltree;
type point=^note;
     note=record
         l,r:point;
         sum,s,t:longint;
     end;
const maxn=20000;
var i,k,m,n,p,q:longint;
    head:point;
    a:array[1..maxn] of longint;
procedure build(var p:point; al,ar:longint);
 var mid:longint;
     w1,w2:point;
 begin
     new(p);
     p^.s:=al; p^.t:=ar; p^.sum:=0;
     if al+1<=ar then begin
        mid:=(al+ar) div 2;
        build(w1,al,mid);
        p^.l:=w1;
        build(w2,mid+1,ar);
        p^.r:=w2;
        p^.sum:=p^.l^.sum+p^.r^.sum;
     end else begin
         p^.l:=nil;
         p^.r:=nil;
         p^.sum:=a[al];
     end;
 end;

procedure modify(var p:point; ai,aj:longint);
 var mid:longint;
 begin
     if (p^.s=ai) and (p^.t=ai) then begin
         p^.sum:=p^.sum+aj;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if ai<=mid then modify(p^.l,ai,aj)
       else modify(p^.r,ai,aj);
     p^.sum:=p^.l^.sum+p^.r^.sum;
 end;

function getsum(var p:point; x,y:longint):longint;
 var mid:longint;
 begin
     if (p^.s=x) and (p^.t=y) then begin
         getsum:=p^.sum;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if y<=mid then begin
         getsum:=getsum(p^.l,x,y);
         exit;
     end;
     if x>=mid+1 then begin
         getsum:=getsum(p^.r,x,y);
         exit;
     end;
     getsum:=getsum(p^.l,x,mid)+getsum(p^.r,mid+1,y);
 end;

begin
    readln(n);
    for i:=1 to n do read(a[i]);
    build(head,1,n);
    readln(m);
    for i:=1 to m do begin
        read(k);
        if k=1 then begin
           readln(p,q);
           k:=a[p];
           a[p]:=q;
           modify(head,p,q-k);
        end else begin
            readln(p,q);
            writeln(getsum(head,p,q));
        end;
    end;
end.