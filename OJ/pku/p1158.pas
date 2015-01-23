program p1158;
const maxtime=410;
type city=record
         r,b,p:longint;
     end;
var a:array[1..300] of city;
    d:array[1..300] of longint;
    map:array[1..300,1..300] of longint;
    f:array[0..300] of boolean;
    s,t,n,m:longint;

procedure init;
 var i,x,y,p:longint;
     c:char;
 begin
     fillchar(map,sizeof(map),0);
     readln(s,t);
     readln(n,m);
     for i:=1 to n do
       with a[i] do begin
           readln(c,r,b,p);
           if c='B' then inc(r,p);
       end;
     for i:=1 to m do begin
         readln(x,y,p);
         map[x,y]:=p;
         map[y,x]:=p;
     end;
 end;

function waittime(s,t,time:longint):longint;
 var ans,mod1,mod2,add1,add2:longint;
 begin
     ans:=0;
     mod1:=a[s].b+a[s].p;
     mod2:=a[t].b+a[t].p;
     add1:=time-a[s].r+mod1*2;
     add2:=time-a[t].r+mod2*2;
     while ans<=maxtime do begin
         if((ans+add1) mod mod1<a[s].b)=((ans+add2) mod mod2<a[t].b) then begin
             waittime:=ans;
             exit;
         end;
         inc(ans);
     end;
     waittime:=-maxint;
 end;

procedure dijkstra;
 var i,j,k,min,x:longint;
 begin
     for i:=1 to n do d[i]:=maxint;
     fillchar(f,sizeof(f),false);
     d[s]:=0;
     for k:=1 to n do begin
         min:=maxint; j:=0;
         for i:=1 to n do
           if not f[i] and (d[i]<maxint) then
              if(j=0) or (d[i]<min) then begin
                  min:=d[i]; j:=i;
              end;
      f[j]:=true;
      if (j=t) or (j=0) then exit;
      for i:=1 to n do
         if not f[i] and (map[i,j]>0) then begin
             x:=waittime(j,i,d[j]);
             if x>=0 then
                if d[i]>x+d[j]+map[i,j] then d[i]:=x+d[j]+map[i,j];
         end;
     end;
 end;


begin
    init;
    dijkstra;
    if f[t] then writeln(d[t]) else writeln('0');
end.