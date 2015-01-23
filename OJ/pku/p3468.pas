program p3468;
const maxn=100000;
type point=^node;
     node=record
         s,t:longint;
         key,tot:int64;
         left,right:point;
     end;
var a:array[1..maxn] of longint;
    tree,nullnode:point;
    ch:char;
    x,y,i,n,m,delta:longint;

procedure initialize;
 begin
     new(nullnode);
     nullnode^.key:=0;
     nullnode^.tot:=0;
     nullnode^.s:=0;
     nullnode^.t:=0;
     nullnode^.left:=nullnode;
     nullnode^.right:=nullnode;
     tree:=nullnode;
 end;

procedure buildtree(var root:point; l,r:longint);
 var w1,w2:point;
     mid:longint;
 begin
     new(root);
     root^.s:=l; root^.t:=r; root^.tot:=0;
     if l+1<r then begin
        mid:=(l+r) shr 1;
        buildtree(w1,l,mid);
        root^.left:=w1;
        buildtree(w2,mid,r);
        root^.right:=w2;
        root^.key:=root^.left^.key+root^.right^.key;
     end else begin
         root^.key:=a[l];
         root^.left:=nullnode;
         root^.right:=nullnode;
     end;
 end;

procedure add(var root:point; l,r,delta:longint);inline;
 var mid:longint;
 begin
     root^.key:=root^.key+(r-l)*delta;
     if (l=root^.s) and (r=root^.t) then begin
         root^.tot:=root^.tot+delta;
         exit;
     end;
     mid:=(root^.s+root^.t) shr 1;
     if r<=mid then begin
         add(root^.left,l,r,delta);
         exit;
     end;
     if l>=mid then begin
         add(root^.right,l,r,delta);
         exit;
     end;
     add(root^.left,l,mid,delta);
     add(root^.right,mid,r,delta);
 end;

function getsum(var root:point; l,r:longint):int64;inline;
 var mid:longint;
 begin
     if (l=root^.s) and (r=root^.t) then begin
         getsum:=root^.key;
         exit;
     end;
     mid:=(root^.s+root^.t) shr 1;
     if (root^.left<>nullnode) and (root^.tot<>0) then begin
         root^.left^.tot:=root^.left^.tot+root^.tot;
         root^.right^.tot:=root^.right^.tot+root^.tot;
         root^.left^.key:=root^.left^.key+(mid-root^.s)*root^.tot;
         root^.right^.key:=root^.right^.key+(root^.t-mid)*root^.tot;
         root^.tot:=0;
     end;
     if r<=mid then begin
         getsum:=getsum(root^.left,l,r);
         exit;
     end;
     if l>=mid then begin
         getsum:=getsum(root^.right,l,r);
         exit;
     end;
     getsum:=getsum(root^.left,l,mid)+getsum(root^.right,mid,r);
 end;

begin
    readln(n,m);
    for i:=1 to n do read(a[i]);
    readln;
    initialize;
    buildtree(tree,1,n+1);
    for i:=1 to m do begin
	read(ch);
	if ch='Q' then begin
	    readln(x,y);
	    writeln(getsum(tree,x,y+1));
	end else if ch='C' then begin
	    readln(x,y,delta);
	    add(tree,x,y+1,delta);
	end;
    end;
end.