program p2299;
const maxn=500000;
var a,x:array[0..maxn] of longint;
    i,n:longint;
    ans:int64;
procedure merge(s,mid,t:longint);
 var i,j,k:longint;
 begin
     i:=s; j:=mid+1; k:=0;
     while (i<=mid) and (j<=t) do
         if (a[i]<=a[j]) then begin
            x[k]:=a[i];
            inc(i); inc(k);
         end else begin
             x[k]:=a[j];
             inc(j); inc(k);
             ans:=ans+mid-i+1;
         end;
     while (i<=mid) do begin
         x[k]:=a[i];
         inc(k); inc(i);   
     end;
     while (j<=t) do begin
         x[k]:=a[j];
         inc(k); inc(j);
     end;
     for i:=0 to k-1 do a[s+i]:=x[i];
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
    while n<>0 do begin
        for i:=1 to n do readln(a[i]);
        ans:=0;
        mergesort(1,n);
        writeln(ans);
        readln(n);
    end;
end.