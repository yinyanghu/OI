program p180;
var r,r2:array[0..65550] of longint;
    n,i:longint;
    total:int64;

procedure merge(l,m,a:int64);
 var i,j,k,v:longint;
 begin
     i:=l; j:=m+1; k:=l-1;
     while (i<=m) and (j<=a) do begin
         inc(k);
         if r[i]<=r[j] then begin
            r2[k]:=r[i];
            inc(i);
         end else begin
             total:=total+m-i+1;
             r2[k]:=r[j];
             inc(j);
         end;
     end;
     if i<=m then
       for v:=k+1 to a do r2[v]:=r[v-a+m];
     if j<=a then
       for v:=k+1 to a do r2[v]:=r[v];
     for v:=l to a do r[v]:=r2[v];
 end;

procedure mergesort(s,t:longint);
 begin
     if s=t then r2[s]:=r[s]
       else begin
           mergesort(s,(s+t) div 2);
           mergesort((s+t) div 2+1,t);
           merge(s,(s+t) div 2,t);
       end;
 end;

begin
    readln(n);
    fillchar(r,sizeof(r),0);
    for i:=1 to n do read(r[i]);
    fillchar(r2,sizeof(r2),0);
    total:=0;
    mergesort(1,n);
    writeln(total);
end.
