program p1002;
var a,b,k,z,total:longint;
    p:array[1..1000000] of longint;
procedure dfs(now:longint);
 var s:longint;
 begin
     if (now+a=k) or (now+b=k) then begin
         total:=total+1;
         exit;
     end;
     if now+a<k then begin
         if p[now+a]<>0 then total:=total+p[now+a]
           else begin
               s:=total;
               dfs(now+a);
               p[now+a]:=total-s;
           end;
     end;
     if now+b<k then begin
         if p[now+b]<>0 then total:=total+p[now+b]
           else begin
               s:=total;
               dfs(now+b);
               p[now+b]:=total-s;
           end;
     end;
 end;

begin
    readln(k,z);
    readln(a,b);
    fillchar(p,sizeof(p),0);
    total:=0;
    dfs(z);
    writeln(total);
end.
