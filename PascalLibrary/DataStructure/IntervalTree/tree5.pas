program intervaltree;
type point=^node;
     node=record
        s,t,count,m:longint;
        left,right:point;
     end;
var head:point;
    n,m:longint;

procedure init;
 procedure build(var q:point; k,l:longint);
  var w1,w2:point;
  begin
      new(q);
      q^.s:=k; q^.t:=l; q^.count:=0; q^.m:=0;
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
     assign(input,'itree.in'); reset(input);
     readln(n,m);
     build(head,1,n+1);
 end;

procedure insert(var p:point; x,y:longint);
 var mid:longint;
 begin
     if (x=p^.s) and (y=p^.t) then begin
         inc(p^.count);
         if p^.count>0 then p^.m:=p^.t-p^.s;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if y<=mid then insert(p^.left,x,y)
       else if x>=mid then insert(p^.right,x,y)
          else begin
              insert(p^.left,x,mid);
              insert(p^.right,mid,y);
          end;
     if p^.count>0 then p^.m:=p^.t-p^.s
       else p^.m:=p^.left^.m+p^.right^.m;
 end;

procedure delete(var p:point; x,y:longint);
 var mid:longint;
 begin
     if (x=p^.s) and (y=p^.t) then begin
         dec(p^.count);
         if p^.count>0 then p^.m:=p^.t-p^.s
           else if (p^.left=nil) and (p^.right=nil) then p^.m:=0
              else p^.m:=p^.left^.m+p^.right^.m;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if y<=mid then delete(p^.left,x,y)
       else if x>=mid then delete(p^.right,x,y)
          else begin
              delete(p^.left,x,mid);
              delete(p^.right,mid,y);
          end;
     if p^.count>0 then p^.m:=p^.t-p^.s
       else p^.m:=p^.left^.m+p^.right^.m;
 end;

function getlength(p:point):longint;
 begin
     getlength:=p^.m;
 end;

procedure main;
 var i,j,k:longint;
     step:char;
 begin
     assign(output,'itree.out'); rewrite(output);
     for i:=1 to m do begin
         read(step);
         case step of
             'I':begin
                   while step<>' ' do read(step);
                   readln(j,k);
                   insert(head,j,k+1);
               end;
             'D':begin
                   while step<>' ' do read(step);
                   readln(j,k);
                   delete(head,j,k+1);
               end;
             'T':begin
                     writeln(getlength(head));
                     readln;
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
