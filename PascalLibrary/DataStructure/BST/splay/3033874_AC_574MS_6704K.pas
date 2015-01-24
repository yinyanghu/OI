type
   node=^code;
   code=record
      num,pin,pin1:longint;
      left,right,father:node;
   end;

var
   i,j,k,l,m,n,a1,a2,a3,a4,tt,p1,p2:longint;
   temp,first,last,root:node;
   h,f:array [1..500000] of longint;

procedure splay(p:node);
   var
      i,j,k:longint;
      q:node;

   procedure zig(p:node);
      var
         q:node;
         pp,qq:longint;
      begin
         q:=p^.father;
         qq:=q^.pin-p^.pin-p^.pin1;
         pp:=p^.pin;
         p^.father:=q^.father;
         if q=root then root:=p
            else if q=q^.father^.left then q^.father^.left:=p
               else q^.father^.right:=p;
         q^.left:=p^.right;
         if p^.right<>nil then p^.right^.father:=q;
         p^.right:=q;
         q^.father:=p;
         q^.pin:=qq;
         p^.pin:=pp;
      end;

   procedure zag(p:node);
      var
         q:node;
         pp,qq:longint;
      begin
         q:=p^.father;
         qq:=q^.pin;
         pp:=q^.pin+p^.pin+q^.pin1;
         p^.father:=q^.father;
         if q=root then root:=p
            else if q=q^.father^.left then q^.father^.left:=p
               else q^.father^.right:=p;
         q^.right:=p^.left;
         if p^.left<>nil then p^.left^.father:=q;
         p^.left:=q;
         q^.father:=p;
         q^.pin:=qq;
         p^.pin:=pp;
      end;

   begin
      while p<>root do
         begin
            if p=p^.father^.left then
               if p^.father=root then zig(p)
                  else if p^.father=p^.father^.father^.left then
                     begin
                       zig(p^.father);
                       zig(p);
                     end
                  else
                     begin
                        zig(p);
                        zag(p);
                     end
            else
               if p^.father=root then zag(p)
                  else if p^.father=p^.father^.father^.right then
                     begin
                       zag(p^.father);
                       zag(p);
                     end
                  else
                     begin
                        zag(p);
                        zig(p);
                     end;
         end;
   end;

procedure s_insert(x:longint);
   var
      p,q,temp:node;
      i,j,k:longint;
   begin
      new(temp);
      temp^.num:=x; temp^.pin:=0; temp^.pin1:=1;
      temp^.father:=nil; temp^.right:=nil; temp^.left:=nil;
      if root=nil then root:=temp else
         begin
            p:=root;
            while p<>nil do
               begin
                  q:=p;
                  if x<p^.num then
                     begin
                        inc(p^.pin);
                        p:=p^.left;
                     end
                  else if x=p^.num then
                     begin
                        inc(p^.pin1);
                        splay(p);
                        exit;
                     end
                  else p:=p^.right;
               end;
            temp^.father:=q;
            if x<=q^.num then q^.left:=temp else q^.right:=temp;
            splay(temp);
         end;
   end;

procedure s_delete(x:longint);
   var
      p,q:node;
      j,i,k:longint;
   begin
      p:=root;
      while (p<>nil) and (p^.num<>x) do
         if x<p^.num then p:=p^.left else p:=p^.right;
      if p^.pin1>1 then
         begin
            p:=root;
            while (p<>nil) and (p^.num<>x) do
               if x<p^.num then begin
                  dec(p^.pin);
                  p:=p^.left;
               end else p:=p^.right;
            dec(p^.pin1);
            splay(p);
            exit;
         end;
      splay(p);
      if root^.left=nil then begin root:=root^.right; exit; end;
      if root^.right=nil then begin root:=root^.left; exit; end;
      p:=root^.right;
      root:=root^.left;
      q:=root;
      while q^.right<>nil do q:=q^.right;
      splay(q);
      root^.right:=p;
      p^.father:=q;
   end;

function s_find(x:longint):longint;
   var
      i,j,k:longint;
      p,q:node;
   begin
      p:=root; k:=x;
      while (p<>nil) and ((k-p^.pin>(p^.pin1-1)) or (k-p^.pin<0)) do
         if k<p^.pin then p:=p^.left
            else begin
               k:=k-p^.pin-(p^.pin1);
               p:=p^.right;
            end;
      s_find:=p^.num;
      splay(p);
   end;

function get(x:longint):longint;
   var
      i,j,k:longint;
   begin
      if f[x]=0 then exit(x)
         else begin
            f[x]:=get(f[x]);
            get:=f[x];
         end;
   end;

begin
   readln(n,m); root:=nil; tt:=n;
   fillchar(f,sizeof(f),0);
   for i:=1 to n do h[i]:=1;
   new(root); root^.pin:=0; root^.pin1:=n; root^.father:=nil;
   root^.left:=nil; root^.right:=nil; root^.num:=1;
   for j:=1 to m do
      begin
         read(a1);
         case a1 of
            0:begin
               read(a2);
               readln(a3);
               a2:=get(a2); a3:=get(a3);
               if a2<>a3 then begin
                  p1:=h[a2]; p2:=h[a3];
                  h[a2]:=p1+p2; h[a3]:=p1+p2;
                  s_delete(p1); s_delete(p2);
                  s_insert(p1+p2); dec(tt);
                  f[a2]:=a3;
               end;
            end;
            1:begin
               read(a2);
               writeln(s_find(tt-a2));
            end;
         end;
      end;
end.
