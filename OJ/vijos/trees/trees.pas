program trees;
var a:array[1..10000,1..3] of longint;
    tr:array[1..40000] of boolean;
    i,j,k,m,n,h,total,p:longint;

procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2,2];
     repeat
        while a[i,2]<x do inc(i);
        while a[j,2]>x do dec(j);
        if i<=j then begin
            y:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=y;
            y:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=y;
            y:=a[i,3]; a[i,3]:=a[j,3]; a[j,3]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'trees.in'); reset(input);
    assign(output,'trees.out'); rewrite(output);
    readln(n);
    readln(h);
    for i:=1 to h do
      for j:=1 to 3 do read(a[i,j]);
    fillchar(tr,sizeof(tr),false);
    sort(1,h);
    for i:=1 to h do begin
        m:=0;
        for j:=a[i,1] to a[i,2] do if tr[j] then inc(m);
        if m=a[i,3] then continue;
        for p:=0 to (a[i,2]-a[i,1]+1) do
            if (tr[a[i,2]-p]=false) and (m<a[i,3]) then begin
                tr[a[i,2]-p]:=true;
                inc(m);
            end;
    end;
    total:=0;
    for i:=1 to n do if tr[i] then inc(total);
    writeln(total);
    close(input);
    close(output);
end.