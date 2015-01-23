program p1944;
const maxp=10000;
      maxn=1000;
      root=1;
type node=record
         x,y:longint;
     end;
var i,k,p,n,min,total:longint;
    a:array[1..maxp] of node;
    left,right,flag:array[1..maxn*3] of longint;
 
procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r; flag[k]:=0;
     if l+1<=r then begin
         mid:=(l+r) shr 1;
         buildtree(k*2,l,mid);
         buildtree(k*2+1,mid+1,r);
     end;
 end;
 
procedure modify(k,l,r:longint);
 var mid:longint;
 begin
     if ((left[k]=l) and (right[k]=r) or (flag[k]=1)) then begin
         flag[k]:=1;
         exit;
     end;
     if flag[k]<>-1 then begin
         flag[k*2]:=flag[k];
         flag[k*2+1]:=flag[k];
         flag[k]:=-1;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then modify(k*2,l,r)
     	else if l>=mid+1 then modify(k*2+1,l,r)
              else begin
                  modify(k*2,l,mid);
                  modify(k*2+1,mid+1,r);
              end;
     if flag[k*2]=flag[k*2+1] then flag[k]:=flag[k*2];
 end;
 
function getsum(k:longint):longint;
 begin
     if flag[k]<>-1 then begin
         if flag[k]=1 then exit(right[k]-left[k]+1);
         exit(0);
     end;
     getsum:=getsum(2*k)+getsum(2*k+1);
 end;
 
begin
    readln(n,p);
    for i:=1 to p do begin
        read(a[i].x,a[i].y);
        if a[i].x>a[i].y then begin
            k:=a[i].x; a[i].x:=a[i].y; a[i].y:=k;
        end;           
    end;
    min:=maxlongint;
    for k:=1 to n-1 do begin
        buildtree(root,1,n);
        for i:=1 to p do begin
            if ((a[i].x>=k) and (a[i].y>=k)) or ((a[i].x<=k) and (a[i].y<=k)) then begin
	       modify(root,a[i].x,a[i].y);
            end else begin
                modify(root,a[i].y,n);
                modify(root,1,a[i].x)
            end;
        end;
        total:=getsum(root)-1;
        if total<min then min:=total;
    end;
    writeln(min);
end.