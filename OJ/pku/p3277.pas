program p3277;
const maxn=40000;
      root=1;
type node=record
	 h,s,t:longint;
     end;
var left,right,high:array[1..maxn*10] of longint;
    a:array[1..maxn] of node;
    point,temp:array[1..maxn*2] of longint;
    i,n,x,y,k,total:longint;
    ans:int64;
procedure initialize;
 begin
     fillchar(high,sizeof(high),0);
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
 end;

procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r; high[k]:=0;
     if l+1=r then exit;
     mid:=(l+r) shr 1;
     buildtree(k*2,l,mid);
     buildtree(k*2+1,mid,r);
 end;

procedure add(k,l,r,delta:longint);
 var mid:longint;
 begin
     if (high[k]>=delta) then exit;
     if (left[k]=l) and (right[k]=r) then begin
         high[k]:=delta;
         exit;
     end;
     if (high[k]>=0) then begin
         high[k*2]:=high[k];
	 high[k*2+1]:=high[k];
	 high[k]:=-1;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then add(k*2,l,r,delta)
     	else if l>=mid then add(k*2+1,l,r,delta)
              else begin
                  add(k*2,l,mid,delta);
                  add(k*2+1,mid,r,delta);
              end;
 end;

function getsum(k:longint):int64;
 begin
     if high[k]>=0 then begin
         getsum:=(point[right[k]]-point[left[k]])*int64(high[k]);
	 exit;
     end;
     getsum:=getsum(k*2)+getsum(k*2+1);
 end;

procedure sortpoint(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=temp[(l+r) shr 1];
     repeat
	while temp[i]<x do inc(i);
	while temp[j]>x do dec(j);
	if i<=j then begin
	    y:=temp[i]; temp[i]:=temp[j]; temp[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sortpoint(l,j);
     if i<r then sortpoint(i,r);
 end;

procedure sortheight(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1].h;
     repeat
	while a[i].h<x do inc(i);
	while a[j].h>x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sortheight(l,j);
     if i<r then sortheight(i,r);
 end;

function change(x:longint):longint;
 var left,right,mid:longint;
 begin
     left:=1; right:=total;
     while left<=right do begin
         mid:=(left+right) shr 1;
	 if (point[mid]<x) then left:=mid+1 else right:=mid-1;
     end;
     change:=left;
 end;

begin
    initialize;
    readln(n);
    k:=0;
    for i:=1 to n do begin
        readln(a[i].s,a[i].t,a[i].h);
	inc(k); temp[k]:=a[i].s;
	inc(k); temp[k]:=a[i].t;
    end;
    sortheight(1,n);
    sortpoint(1,k);
    total:=1; point[1]:=temp[1];
    for i:=2 to k do
	if temp[i]<>temp[i-1] then begin
	    inc(total); point[total]:=temp[i];
	end;
    buildtree(root,1,total);
    for i:=1 to n do begin
        x:=change(a[i].s); y:=change(a[i].t);
	add(root,x,y,a[i].h);
    end;
    ans:=getsum(root);
    writeln(ans);
end.
