program p2750;
const maxn=100000;
type point=^node;
     node=record
        max,min,lmax,lmin,rmax,rmin,sum,s,t:longint;
        left,right:point;
     end;
var head:point;
    n,m,flag:longint;
    a:array[1..maxn] of longint;

function tmax(a,b,c:longint):longint;
 begin
     if a>b then tmax:=a else tmax:=b;
     if tmax<c then tmax:=c;
 end;

function tmin(a,b,c:longint):longint;
 begin
     if a>b then tmin:=b else tmin:=a;
     if tmin>c then tmin:=c;
 end;

procedure update(var p:point);
 begin
     p^.max:=tmax(p^.left^.max,p^.right^.max,p^.left^.rmax+p^.right^.lmax);
     p^.min:=tmin(p^.left^.min,p^.right^.min,p^.left^.rmin+p^.right^.lmin);
     p^.lmax:=tmax(p^.left^.lmax,p^.left^.sum+p^.right^.lmax,-maxlongint);
     p^.lmin:=tmin(p^.left^.lmin,p^.left^.sum+p^.right^.lmin,maxlongint);
     p^.rmax:=tmax(p^.right^.rmax,p^.right^.sum+p^.left^.rmax,-maxlongint);
     p^.rmin:=tmin(p^.right^.rmin,p^.right^.sum+p^.left^.rmin,maxlongint);
     p^.sum:=p^.left^.sum+p^.right^.sum;
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
         update(q);
      end else begin
          q^.left:=nil;
          q^.right:=nil;
          q^.max:=a[k]; q^.min:=a[k];
          q^.lmax:=a[k]; q^.lmin:=a[k];
          q^.rmax:=a[k]; q^.rmin:=a[k];
          q^.sum:=a[k];
      end;
  end;

 begin
     readln(n); flag:=0;
     for i:=1 to n do begin
         read(a[i]);
         if a[i]<=0 then inc(flag);
     end;
     build(head,1,n);
     readln;
 end;

procedure modify(var p:point; ai,aj:longint);
 var mid:longint;
 begin
     if (p^.s=ai) and (p^.t=ai) then begin
         p^.max:=aj; p^.min:=aj;
         p^.lmax:=aj; p^.lmin:=aj;
         p^.rmax:=aj; p^.rmin:=aj;
         p^.sum:=aj;
         exit;
     end;
     mid:=(p^.s+p^.t) div 2;
     if ai<=mid then modify(p^.left,ai,aj)
        else modify(p^.right,ai,aj);
     update(p);
 end;


procedure main;
 var i,k,p,ans:longint;
 begin
     readln(m);
     for i:=1 to m do begin
         readln(k,p);
         if (a[k]<=0) and (p>0) then dec(flag)
           else if (a[k]>0) and (p<=0) then inc(flag);
         a[k]:=p;
         modify(head,k,p);
         if flag=0 then ans:=head^.sum-head^.min
           else ans:=tmax(head^.max,head^.sum-head^.min,-maxlongint);
         writeln(ans);
     end;
 end;

begin
    init;
    main;
end.