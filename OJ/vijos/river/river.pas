program river;
var n,t,s,i,l,j,k,total:longint;
    a:array[0..100] of longint;
    ans:array[0..50000] of longint;
    ok:array[0..50000] of boolean;

procedure sort(l,r:integer);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     repeat
        while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then begin
            y:=a[i]; a[i]:=a[j]; a[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then sort(l, j);
     if i<r then sort(i, r);
 end;

begin
    assign(input,'river.in'); reset(input);
    assign(output,'river.out'); rewrite(output);
    fillchar(a,sizeof(a),0);
    fillchar(ans,sizeof(ans),$77);
    fillchar(ok,sizeof(ok),false);
    readln(l);
    readln(s,t,n);
    for i:=1 to n do read(a[i]);
    sort(1,n);
    if s=t then begin
       total:=0;
       for i:=1 to n do if a[i] mod s=0 then inc(total);
       writeln(total);
    end else begin
        for i:=1 to n do begin
            k:=a[i]-a[i-1];
            if k>200 then begin
                k:=k-200;
                for j:=i to n do a[j]:=a[j]-k;
            end;
        end;
        for i:=1 to n do ok[a[i]]:=true;
        ans[0]:=0;
        for i:=0 to 30000 do
          for j:=s to t do begin
              if ok[i+j] then k:=ans[i]+1 else k:=ans[i];
              if k<ans[i+j] then ans[i+j]:=k;
          end;
        writeln(ans[30000]);
    end;
    close(input);
    close(output);
end.