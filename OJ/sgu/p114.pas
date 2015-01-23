program p114;
var n,sum:longint;
    x:array[1..15000] of extended;
    p:array[1..15000] of longint;

procedure init;
 var i:longint;
 begin
     readln(n);
     sum:=0;
     for i:=1 to n do begin
         readln(x[i],p[i]);
         sum:=sum+p[i];
     end;
 end;

procedure sort(l,r:longint);
 var i,j,y:longint;
     k,t:extended;
 begin
     i:=l; j:=r; k:=x[(l+r) div 2];
     repeat
         while x[i]<k do inc(i);
         while x[j]>k do dec(j);
         if i<=j then begin
             t:=x[i]; x[i]:=x[j]; x[j]:=t;
             y:=p[i]; p[i]:=p[j]; p[j]:=y;
             inc(i); dec(j);
         end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure work;
 var i,k,c:longint;
 begin
     c:=0;
     for i:=1 to n do begin
         c:=c+p[i];
         if c>=sum-c then break
     end;
     k:=i;
     writeln(x[k]:0:5)
 end;

begin
    init;
    if 1<n then sort(1,n);
    if n=0 then begin
        writeln('0.00000');
        halt
    end;
    work;
end.
{const maxn=15000;
type node=record
         x:double;
         v:longint;
     end;

var f:array[1..maxn] of node;
    sum:array[0..maxn] of longint;
    a:array[0..50000] of longint;
    n:longint;
    ans:double;

procedure init;
 var i,x,y:longint;
 begin
    readln(n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do begin
        readln(x,y);
        a[x]:=a[x]+y;
    end;
    n:=0;
    for i:=0 to 50000 do
      if a[i]>0 then begin
          inc(n);
          f[n].x:=i;
          f[n].v:=a[i];
      end;
    fillchar(sum,sizeof(sum),0);
    for i:=1 to n do sum[i]:=sum[i-1]+f[i].v;
end;

procedure work;
 var i:longint;
 begin
     for i:=1 to n do
       if sum[i]>=sum[n]-sum[i] then begin
           ans:=f[i].x;
           writeln(ans:0:5);
           break;
       end;
 end;

begin
    init;
    work;
end.
}
{type node=record
         v:longint;
         x:extended;
     end;
var a:array[1..15000] of node;
    i,j,n,mid,l,r:longint;
    min,total,ans:extended;

procedure sort(l,r:longint);
 var i,j:longint;
     k:node;
     x:extended;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].x;
     repeat
         while a[i].x<x do inc(i);
         while a[j].x>x do dec(j);
         if i<=j then begin
             k:=a[i]; a[i]:=a[j]; a[j]:=k;
             inc(i); dec(j);
         end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'p114.in'); reset(input);
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].v);
    close(input);
    sort(1,n); min:=1000000000000;
    mid:=n div 2;
    l:=mid-60; r:=mid+60;
    if l<1 then l:=1;
    if r>n then r:=n;
    for i:=l to r do begin
        total:=0;
        for j:=1 to n do
            if i<>j then begin
                total:=total+abs(a[i].x-a[j].x)*a[j].v;
                if total>min then break;
            end;
        if total<=min then begin
            min:=total;
            ans:=a[i].x;
        end;
    end;
    writeln(ans:0:5);
end.
}
