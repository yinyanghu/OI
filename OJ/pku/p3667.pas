program p3667;
const maxn=50000;
      root=1;
var left,right,lmax,rmax,cmax,size,flag:array[1..maxn*10] of longint;
    i,n,m,k,x,p:longint;
procedure initialize;
 begin
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
     fillchar(lmax,sizeof(lmax),0);
     fillchar(rmax,sizeof(rmax),0);
     fillchar(cmax,sizeof(cmax),0);
     fillchar(flag,sizeof(flag),0);
     fillchar(size,sizeof(size),0);
 end;

function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;

procedure updata(k:longint);
 begin
     if (flag[k*2]=0) and (flag[k*2+1]=0) then begin
         flag[k]:=0;
	 lmax[k]:=size[k]; rmax[k]:=size[k]; cmax[k]:=size[k];
	 exit;
     end;
     if (flag[k*2]=1) and (flag[k*2+1]=1) then begin
         flag[k]:=1;
	 lmax[k]:=0; rmax[k]:=0; cmax[k]:=0;
	 exit;
     end;
     flag[k]:=2;
     if flag[k*2]=0 then lmax[k]:=size[k*2]+lmax[k*2+1] else lmax[k]:=lmax[k*2];
     if flag[k*2+1]=0 then rmax[k]:=rmax[k*2]+size[k*2+1] else rmax[k]:=rmax[k*2+1];
     cmax[k]:=max(max(cmax[k*2],cmax[k*2+1]),rmax[k*2]+lmax[k*2+1]);
 end;

procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r; flag[k]:=0;
     if l+1=r then begin
         size[k]:=1;
         lmax[k]:=size[k]; rmax[k]:=size[k]; cmax[k]:=size[k];
         exit;
     end;
     mid:=(l+r) shr 1;
     buildtree(k*2,l,mid);
     buildtree(k*2+1,mid,r);
     size[k]:=size[k*2]+size[k*2+1];
     lmax[k]:=size[k]; rmax[k]:=size[k]; cmax[k]:=size[k];
 end;

procedure passmark(k:longint);
 begin
     if flag[k]=0 then begin
         flag[k*2]:=0; flag[k*2+1]:=0;
	 lmax[k*2]:=size[k*2]; lmax[k*2+1]:=size[k*2+1];
	 rmax[k*2]:=size[k*2]; rmax[k*2+1]:=size[k*2+1];
	 cmax[k*2]:=size[k*2]; cmax[k*2+1]:=size[k*2+1];
     end;
     if flag[k]=1 then begin
         flag[k*2]:=1; flag[k*2+1]:=1;
	 lmax[k*2]:=0; lmax[k*2+1]:=0;
	 rmax[k*2]:=0; rmax[k*2+1]:=0;
	 cmax[k*2]:=0; cmax[k*2+1]:=0;
     end;
 end;

function check(k,x:longint):longint;
 begin
     if (flag[k]=0) and (size[k]<=x) then exit(left[k]);
     if left[k]+1=right[k] then exit(0);
     passmark(k);
     if cmax[k*2]>=x then exit(check(k*2,x));
     if rmax[k*2]+lmax[k*2+1]>=x then exit(right[k*2]-rmax[k*2]);
     if cmax[k*2+1]>=x then exit(check(k*2+1,x));
     check:=0;
 end;

procedure fill(k,l,r,x:longint);
 var mid:longint;
 begin
     passmark(k);
     if (left[k]=l) and (right[k]=r) then begin
         flag[k]:=x;
	 if x=0 then begin
	     lmax[k]:=size[k]; rmax[k]:=size[k]; cmax[k]:=size[k];
	 end else begin
	     lmax[k]:=0; rmax[k]:=0; cmax[k]:=0;
	 end;
	 exit;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then fill(k*2,l,r,x)
	else if l>=mid then fill(k*2+1,l,r,x)
	     else begin
	         fill(k*2,l,mid,x);
		 fill(k*2+1,mid,r,x);
	     end;
     updata(k);
 end;


begin
    initialize;
    readln(n,m);
    buildtree(root,1,n+1);
    for i:=1 to m do begin
        read(k);
        if k=1 then begin
           readln(x);
           p:=check(root,x);
	   writeln(p);
	   if p>0 then fill(root,p,p+x,1);
        end else begin
            readln(x,p);
            fill(root,x,x+p,0)
        end;
    end;
end.
