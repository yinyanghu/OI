{$inline on}
program p3264;
const maxn=50000;
type point=^node;
     node=record
        max,min,s,t:longint;
        left,right:point;
     end;
var head:point;
    n,m:longint;
    a:array[0..maxn] of longint;

function cmax(a,b:longint):longint;
 begin
     if a<b then cmax:=b else cmax:=a;
 end;

function cmin(a,b:longint):longint;
 begin
     if a<b then cmin:=a else cmin:=b;
 end;

procedure init;
 var i:longint;
 procedure build(var q:point; k,l:longint);
  var w1,w2:point;
  begin
      new(q);
      q^.s:=k; q^.t:=l;
      if l>=k+1 then begin
         build(w1,k,(k+l) div 2);
         q^.left:=w1;
         build(w2,(k+l) div 2+1,l);
         q^.right:=w2;
         q^.max:=cmax(q^.left^.max,q^.right^.max);
         q^.min:=cmin(q^.left^.min,q^.right^.min);
      end else begin
          q^.left:=nil; q^.right:=nil;
          q^.max:=a[k]; q^.min:=a[k];
      end;
  end;

 begin
     readln(n,m);
     for i:=1 to n do readln(a[i]);
     build(head,1,n);
 end;


procedure query(var p:point; gi,gj:longint; var nmax,nmin:longint);inline;
 var mid,max1,max2,min1,min2:longint;
 begin
     if (gi=p^.s) and (gj=p^.t) then begin
         nmax:=p^.max;
         nmin:=p^.min;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if gj<=mid then begin
         query(p^.left,gi,gj,nmax,nmin);
         exit;
     end;
     if gi>=mid+1 then begin
         query(p^.right,gi,gj,nmax,nmin);
         exit;
     end;
     query(p^.left,gi,mid,max1,min1);
     query(p^.right,mid+1,gj,max2,min2);
     nmax:=cmax(max1,max2);
     nmin:=cmin(min1,min2);
 end;

procedure main;
 var i,p,q,max,min:longint;
 begin
     for i:=1 to m do begin
         readln(p,q);
         query(head,p,q,max,min);
         writeln(max-min);
     end;
 end;

begin
    init;
    main;
end.
