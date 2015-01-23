program p3256;
type node=record
         num:longint;
         link:array[1..1000] of longint;
     end;
var a:array[1..1000] of node;
    q,ans:array[1..1000] of longint;
    ok:array[1..1000] of boolean;
    ma:array[1..100] of longint;
    i,j,k,p,l,r,n,m,x,y,total:longint;
begin
    readln(k,n,m);
    fillchar(ans,sizeof(ans),0);
    for i:=1 to k do readln(ma[i]);
    for i:=1 to n do a[i].num:=0;
    for i:=1 to m do begin
        readln(x,y);
        inc(a[x].num);
        a[x].link[a[x].num]:=y;
    end;
    for p:=1 to k do begin
        fillchar(ok,sizeof(ok),true);
        l:=1; r:=1; q[1]:=ma[p];
        ok[q[1]]:=false; inc(ans[q[1]]);
        while l<=r do begin
            i:=q[l];
            for j:=1 to a[i].num do
              if ok[a[i].link[j]] then begin
                  inc(r);
                  q[r]:=a[i].link[j];
                  inc(ans[q[r]]);
                  ok[q[r]]:=false;
              end;
            inc(l);
        end;
    end;
    total:=0;
    for i:=1 to n do
      if ans[i]=k then inc(total);
    writeln(total);
end.