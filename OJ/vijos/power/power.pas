program power;
type data=record
         v,dis:longint;
     end;
var i,j,k,m,n,v,min:longint;
    a:array[1..1000] of data;
    s:array[1..10000] of boolean;

function dist(a,b:longint):longint;
 begin
     dist:=abs(a-b);
 end;

procedure dfs(p,time,now:longint);
 var i,j,s1,s2,t,value:longint;
 begin
     if (now>min) then exit;
     s1:=0; s2:=0;
     for i:=p+1 to n do
        if s[a[i].dis] then begin
            s1:=i;
            break;
        end;
     for i:=p-1 downto 1 do
       if s[a[i].dis] then begin
           s2:=i;
           break;
       end;
     if (s1<>0) then begin
         s[a[s1].dis]:=false;
         t:=time+dist(a[p].dis,a[s1].dis);
         value:=now+t*a[s1].v;
         dfs(s1,t,value);
         s[a[s1].dis]:=true;
     end;
     if (s2<>0) then begin
         s[a[s2].dis]:=false;
         t:=time+dist(a[p].dis,a[s2].dis);
         value:=now+t*a[s2].v;
         dfs(s2,t,value);
         s[a[s2].dis]:=true;
     end;
     if (s2=0) and (s1=0) then
       if min>now then min:=now;
 end;

begin
    assign(input,'power.in'); reset(input);
    readln(n); readln(v);
    for i:=1 to n do readln(a[i].dis,a[i].v);
    close(input);
    fillchar(s,sizeof(s),true);
    min:=maxlongint;
    s[a[v].dis]:=false;
    dfs(v,0,0);
    assign(output,'power.out'); rewrite(output);
    writeln(min);
    close(output);
end.