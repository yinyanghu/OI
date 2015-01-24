program intervaltree;
const maxn=100000;
type point=^node;
     node=record
        sum,tot,s,t:longint;
        left,right:point;
     end;
var head:point;
    n,m:longint;
    temp,a:array[0..maxn] of longint;
procedure init;
 var i:longint;
 procedure build(var q:point; k,l:longint);
  var w1,w2:point;
  begin
      new(q);
      q^.s:=k; q^.t:=l;
      q^.tot:=0; q^.sum:=temp[l-1]-temp[k-1];
      if l>k+1 then begin
         build(w1,k,(k+l) div 2);
         q^.left:=w1;
         build(w2,(k+l) div 2,l);
         q^.right:=w2;
      end else begin
          q^.left:=nil;
          q^.right:=nil;
      end;
  end;

 begin
     assign(input,'tree.in'); reset(input);
     readln(n,m);
     fillchar(temp,sizeof(temp),0);
     for i:=1 to n do begin
         read(a[i]);
         temp[i]:=temp[i-1]+a[i];
     end;
     build(head,1,n+1);
     readln;
 end;

procedure add(var p:point; ai,aj,ak:longint);
 var mid:longint;
 begin
     inc(p^.sum,(aj-ai)*ak);
     if (ai=p^.s) and (aj=p^.t) then begin
         inc(p^.tot,ak);
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if aj<=mid then begin
         add(p^.left,ai,aj,ak);
         exit;
     end;
     if ai>=mid then begin
         add(p^.right,ai,aj,ak);
         exit;
     end;
     add(p^.left,ai,mid,ak);
     add(p^.right,mid,aj,ak);
 end;

function getsum(var p:point; gi,gj:longint):longint;
 var mid:longint;
 begin
     if (gi=p^.s) and (gj=p^.t) then begin
         getsum:=p^.sum;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if p^.left<>nil then
       if p^.tot<>0 then begin
           inc(p^.left^.tot,p^.tot);
           inc(p^.right^.tot,p^.tot);
           inc(p^.left^.sum,(mid-p^.s)*p^.tot);
           inc(p^.right^.sum,(p^.t-mid)*p^.tot);
           p^.tot:=0;
       end;
     if gj<=mid then begin
         getsum:=getsum(p^.left,gi,gj);
         exit;
     end;
     if gi>=mid then begin
         getsum:=getsum(p^.right,gi,gj);
         exit;
     end;
     getsum:=getsum(p^.left,gi,mid)+getsum(p^.right,mid,gj);
 end;

procedure main;
 var i,j,k,l:longint;
     step:char;
 begin
     assign(output,'tree.out'); rewrite(output);
     for i:=1 to m do begin
         read(step);
         case step of
             'A':begin
                   while step<>' ' do read(step);
                   readln(j,k,l);
                   add(head,j,k+1,l);
               end;
             'S':begin
                   while step<>' ' do read(step);
                   readln(j,k);
                   writeln(getsum(head,j,k+1));
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
