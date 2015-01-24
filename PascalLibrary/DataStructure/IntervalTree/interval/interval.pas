program interval;
const maxn=100000;
      root=1;
var key,tot,left,right:array[1..maxn*4] of longint;
    a:array[1..maxn] of longint;
    i,n,m,x,y,delta,k:longint;
procedure init;
 begin
     fillchar(key,sizeof(key),0);
     fillchar(tot,sizeof(tot),0);
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
 end;
 
procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r;
     if l+1=r then begin
         key[k]:=a[l];
         exit;
     end;
     mid:=(l+r) shr 1;
     buildtree(k*2,l,mid);
     buildtree(k*2+1,mid,r);
     key[k]:=key[k*2]+key[k*2+1];
 end;
 
procedure add(k,l,r,delta:longint);inline;
 var mid:longint;
 begin
     inc(key[k],(r-l)*delta);
     if (left[k]=l) and (right[k]=r) then begin
         inc(tot[k],delta);
         exit;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then add(k*2,l,r,delta)
     	else if l>=mid then add(k*2+1,l,r,delta)
              else begin
                  add(k*2,l,mid,delta);
                  add(k*2+1,mid,r,delta);
              end;
 end;
 
function getsum(k,l,r:longint):longint;inline;
 var mid:longint;
 begin
     if (l=left[k]) and (r=right[k]) then exit(key[k]);
     if tot[k]<>0 then begin
         inc(tot[k*2],tot[k]);
         inc(tot[k*2+1],tot[k]);
         inc(key[k*2],(right[k*2]-left[k*2])*tot[k]);
         inc(key[k*2+1],(right[k*2+1]-left[k*2+1])*tot[k]);
         tot[k]:=0;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then getsum:=getsum(k*2,l,r)
     	else if l>=mid then getsum:=getsum(k*2+1,l,r)
              else getsum:=getsum(k*2,l,mid)+getsum(k*2+1,mid,r);
     
 end;
 
begin
    assign(input,'interval.in'); reset(input);
    assign(output,'interval.out'); rewrite(output);
    init;
    readln(n,m);
    for i:=1 to n do read(a[i]);
    readln;
    buildtree(root,1,n+1);
    for i:=1 to m do begin
        read(k);
        if k=1 then begin
           readln(x,y,delta);
           add(root,x,y+1,delta);
        end else begin
            readln(x,y);
            writeln(getsum(root,x,y+1));
        end;
    end;
    close(input);
    close(output);
end.