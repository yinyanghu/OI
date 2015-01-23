program p354;
const maxn=800;
      white=0;
      grey=1;
      black=2;
      root=1;
type node=record
         key,x,y:longint;
     end;

var mapleft,mapup,color:array[1..maxn,1..maxn] of longint;
    a:array[1..maxn,1..maxn] of node;
    left,right,pos,key,total:array[1..maxn*10] of longint;
    w:array[1..maxn] of longint;
    n,flag:longint;

procedure quit;
 begin
     writeln(0);
     halt;
 end;

procedure init;
 var i,j:longint;
 begin
     fillchar(mapup,sizeof(mapup),0);
     fillchar(mapleft,sizeof(mapleft),0);
     readln(n);
     for i:=1 to n do
     	for j:=1 to n do begin
             read(mapup[i,j]);
             if mapup[i,j]>=i then quit;
         end;
     for i:=1 to n do
     	for j:=1 to n do begin
             read(mapleft[i,j]);
             if mapleft[i,j]>=j then quit;
         end;
 end;

procedure clear;
 begin
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
     fillchar(total,sizeof(total),0);
     fillchar(key,sizeof(key),0);
     fillchar(w,sizeof(w),0);
     fillchar(pos,sizeof(pos),0);
 end;

procedure upload(k:longint);
 begin
     if key[2*k]<key[2*k+1] then begin
        pos[k]:=pos[2*k];
        key[k]:=key[2*k];
     end else begin
         pos[k]:=pos[2*k+1];
         key[k]:=key[2*k+1];
     end;
 end;

procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r;
     if (l+1=r) then begin
         key[k]:=w[l];
         pos[k]:=l;
         exit;
     end;
     mid:=(l+r) shr 1;
     buildtree(k shl 1,l,mid);
     buildtree(k shl 1+1,mid,r);
     upload(k);
 end;

procedure modify(k,x:longint);
 var mid:longint;
 begin
     mid:=(left[k]+right[k]) shr 1;
     if (left[k]+1=right[k]) then begin
         key[k]:=maxlongint;
         total[k]:=0;
         exit;
     end;
     if total[k]<>0 then begin
         inc(total[k shl 1],total[k]);
         inc(total[k shl 1+1],total[k]);
         inc(key[k shl 1],total[k]);
         inc(key[k shl 1+1],total[k]);
         total[k]:=0;
     end;
     if x<mid then modify(k shl 1,x) else modify(k shl 1+1,x);
     upload(k);
 end;

procedure add(k,l,r:longint);
 var mid:longint;
 begin
     if (left[k]=l) and (right[k]=r) then begin
         dec(key[k]); dec(total[k]);
         exit;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then add(k shl 1,l,r)
     	else if l>=mid then add(k shl 1+1,l,r)
              else if (l>=left[k]) and (r<=right[k]) then begin
                  add(k shl 1,l,mid);
                  add(k shl 1+1,mid,r);
              end;
     upload(k);
 end;

procedure buildmap;
 var i,j,k,min,last:longint;
 begin
     fillchar(a,sizeof(a),0);
     for i:=1 to n do begin
         last:=0; clear;
         for j:=1 to n do w[j]:=mapleft[i,j];
         buildtree(root,1,n+1);
         for k:=1 to n do begin
             min:=pos[root];
             modify(root,min);
             if last<>0 then a[i,last].y:=min;
             if (min<>n) and (k<>n) then add(root,min+1,n+1);
             last:=min;
         end;
     end;
     for j:=1 to n do begin
         last:=0; clear;
         for i:=1 to n do w[i]:=mapup[i,j];
         buildtree(root,1,n+1);
         for k:=1 to n do begin
	     min:=pos[root];
             modify(root,min);
             if last<>0 then a[last,j].x:=min;
             if (min<>n) and (k<>n) then add(root,min+1,n+1);
             last:=min;
         end;
     end;
 end;

procedure dfs(x,y:longint);
 var xx,yy:longint;
 begin
     color[x,y]:=grey;
     xx:=x; yy:=a[x,y].y;
     if color[xx,yy]=grey then quit;
     if (xx<>0) and (yy<>0) and (color[xx,yy]=white) then dfs(xx,yy);
     xx:=a[x,y].x; yy:=y;
     if color[xx,yy]=grey then quit;
     if (xx<>0) and (yy<>0) and (color[xx,yy]=white) then dfs(xx,yy);
     inc(flag);
     a[x,y].key:=flag;
     color[x,y]:=black;
 end;

procedure topsort;
 var i,j:longint;
 begin
     fillchar(color,sizeof(color),0);
     flag:=0;
     for i:=1 to n do
     	for j:=1 to n do
             if color[i,j]=white then dfs(i,j);
 end;

procedure main;
 begin
     buildmap;
     topsort;
 end;

procedure print;
 var i,j:longint;
 begin
     for i:=1 to n do begin
         for j:=1 to n do write(a[i,j].key,' ');
         writeln;
     end;
 end;

begin
    init;
    main;
    print;
end.