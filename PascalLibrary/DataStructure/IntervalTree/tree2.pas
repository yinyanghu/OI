program intervaltree;
const maxn=100000;
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
          q^.left:=nil;
          q^.right:=nil;
          q^.max:=a[k];
          q^.min:=a[k];
      end;
  end;

 begin
     assign(input,'intree.in'); reset(input);
     readln(n,m);
     for i:=1 to n do read(a[i]);
     build(head,1,n);
     readln;
 end;

procedure modify(var p:point; ai,aj:longint);
 var mid:longint;
 begin
     if (p^.s=ai) and (p^.t=ai) then begin
         p^.max:=aj;
         p^.min:=aj;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if ai<=mid then modify(p^.left,ai,aj)
        else modify(p^.right,ai,aj);
     p^.max:=cmax(p^.left^.max,p^.right^.max);
     p^.min:=cmin(p^.left^.min,p^.right^.min);
 end;

function getmax(var p:point; gi,gj:longint):longint;
 var mid:longint;
 begin
     if (gi=p^.s) and (gj=p^.t) then begin
         getmax:=p^.max;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if gj<=mid then begin
         getmax:=getmax(p^.left,gi,gj);
         exit;
     end;
     if gi>=mid+1 then begin
         getmax:=getmax(p^.right,gi,gj);
         exit;
     end;
     getmax:=cmax(getmax(p^.left,gi,mid),getmax(p^.right,mid+1,gj));
 end;

function getmin(var p:point; gi,gj:longint):longint;
 var mid:longint;
 begin
     if (gi=p^.s) and (gj=p^.t) then begin
         getmin:=p^.min;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if gj<=mid then begin
         getmin:=getmin(p^.left,gi,gj);
         exit;
     end;
     if gi>=mid+1 then begin
         getmin:=getmin(p^.right,gi,gj);
         exit;
     end;
     getmin:=cmin(getmin(p^.left,gi,mid),getmin(p^.right,mid+1,gj));
 end;

procedure main;
 var i,j,k,p,q:longint;
     step:char;
 begin
     assign(output,'intree.out'); rewrite(output);
     for i:=1 to m do begin
         read(step); read(step);
         case step of
             'O':begin
                   while step<>' ' do read(step);
                   readln(j,k);
                   modify(head,j,k);
               end;
             'A':begin
                   while step<>' ' do read(step);
                   readln(p,q);
                   writeln(getmax(head,p,q));
               end;
             'I':begin
                     while step<>' ' do read(step);
                     readln(p,q);
                     writeln(getmin(head,p,q));
                 end;
         end;
     end;
     close(input);
     close(output);
 end;

begin
    init;
    main;
end.
