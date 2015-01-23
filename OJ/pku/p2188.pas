program p2188;
const maxn=1000;
type node=record
         s,t:longint;
     end;
var a:array[1..maxn] of node;
    w:array[0..maxn] of longint;
    x,y,n,i,ans:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1].s;
     repeat
     	while a[i].s<x do inc(i);
         while a[j].s>x do dec(j);
         if i<=j then begin
             y:=a[i]; a[i]:=a[j]; a[j]:=y;
             inc(i); dec(j);
         end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure merge(s,mid,t:longint);
 var i,j,k:longint;
 begin
     i:=s; j:=mid+1; k:=0;
     while (i<=mid) and (j<=t) do
         if (a[i].t<=a[j].t) then begin
            w[k]:=a[i].t;
            inc(i); inc(k);
         end else begin
             w[k]:=a[j].t;
             inc(j); inc(k);
             ans:=ans+mid-i+1;
         end;
     while (i<=mid) do begin
         w[k]:=a[i].t;
         inc(k); inc(i);   
     end;
     while (j<=t) do begin
         w[k]:=a[j].t;
         inc(k); inc(j);
     end;
     for i:=0 to k-1 do a[s+i].t:=w[i];
 end;
 
procedure mergesort(s,t:longint);
 var mid:longint;
 begin
     if s<t then begin                                                                                         
         mid:=(s+t) div 2;
         mergesort(s,mid);
         mergesort(mid+1,t);
         merge(s,mid,t);
     end;
 end;
 
begin
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        a[x].s:=i; a[y].t:=i;
    end;
    sort(1,n);
    ans:=0;
    mergesort(1,n);
    writeln(ans);
end.