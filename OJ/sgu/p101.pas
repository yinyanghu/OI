program p101;
const maxn=100;
type node=record
         s,t:longint;
     end;
var e:array[1..maxn] of node;
    d:array[0..6] of longint;
    m:array[0..6,0..6] of longint;
    path:array[1..maxn+1] of longint;
    used:array[1..maxn] of boolean;
    n,pcount,oddnum,start,min,max:longint;
    error:boolean;
procedure init;
 var i:longint;
 begin
     fillchar(d,sizeof(d),0);
     min:=6; max:=0;
     readln(n);
     for i:=1 to n do begin
         readln(e[i].s,e[i].t);
         inc(d[e[i].s]);
         inc(d[e[i].t]);
         inc(m[e[i].s,e[i].t]);
         inc(m[e[i].t,e[i].s]);
         if e[i].s<min then min:=e[i].s; if e[i].t<min then min:=e[i].t;
         if e[i].s>max then max:=e[i].s; if e[i].t>max then max:=e[i].t;
     end;
     start:=0;
     for i:=min to max do if odd(d[i]) then begin
         inc(oddnum);
         start:=i;
     end;
     if start=0 then start:=min;
     if oddnum>2 then error:=true;
 end;

procedure search(x:longint);
 var i:longint;
     f:boolean;
 begin
     for i:=min to max do
       if (m[x,i]>0) then begin
           dec(m[x,i]);
           dec(m[i,x]);
           search(i);
       end;
     inc(pcount);
     path[pcount]:=x;
 end;

procedure print;
 var i,j,s,t:longint;
 begin
     fillchar(used,sizeof(used),0);
     for i:=1 to n do begin
         s:=path[i]; t:=path[i+1];
         for j:=1 to n do
           if not used[j] then begin
               if(s=e[j].s) and (t=e[j].t) then begin
                  writeln(j,' +');
                  used[j]:=true;
                  break;
               end else
                 if(s=e[j].t) and (t=e[j].s) then begin
                     writeln(j,' -');
                     used[j]:=true;
                     break;
                 end;
           end;
     end;
 end;

begin
    error:=false;
    init;
    pcount:=0;
    search(start);
    if error or (pcount<n+1) then begin
        writeln('No solution');
        halt;
    end;
    print;
end.
{var i,j,n:longint;
    a,ans:array[1..100,1..2] of longint;
    ok:array[1..100] of boolean;
procedure print;
 var i:longint;
 begin
     for i:=1 to n do begin
         write(ans[i,1],' ');
         if ans[i,2]=1 then writeln('+')
           else writeln('-');
     end;
     halt;
 end;

procedure dfs(k,now:longint);
 var i:longint;
 begin
     for i:=1 to n do
       if ok[i] then begin
           if (k<>1) and ((a[i,1]=now) or (a[i,2]=now)) then begin
               ok[i]:=false;
               ans[k,1]:=i;
               if a[i,1]=now then begin
                   ans[k,2]:=1;
                   if k=5 then print
                     else dfs(k+1,a[i,2]);
               end;
               if a[i,2]=now then begin
                   ans[k,2]:=2;
                   if k=5 then print
                     else dfs(k+1,a[i,1]);
               end;
               ok[i]:=true;
           end;
           if k=1 then begin
               ok[i]:=false;
               ans[k,1]:=i;
               ans[k,2]:=1;
               dfs(k+1,a[i,2]);
               ans[k,2]:=2;
               dfs(k+1,a[i,1]);
               ok[i]:=true;
           end;
       end;
 end;

begin
    readln(n);
    for i:=1 to n do
      for j:=1 to 2 do read(a[i,j]);
    fillchar(ok,sizeof(ok),true);
    dfs(1,7);
    writeln('No solution');
end.
}
