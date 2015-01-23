program loj_0234;
var i,j,k,n,min,v:longint;
    dis:array[0..1000] of longint;
    s:array[-1000..1000] of boolean;

procedure dfs(p,now,k:longint);
 var i,s1,s2,t,w:longint;
 begin
     if (now>min) then exit;
     s1:=0; s2:=0;
     for i:=p+1 to n do
        if (s[dis[i]]) then begin
            s1:=i;
            break;
        end;
     for i:=p-1 downto 1 do
       if (s[dis[i]]) then begin
           s2:=i;
           break;
       end;
     if (s1<>0) then begin
         s[dis[s1]]:=false;
         w:=k+abs(dis[p]-dis[s1]);
         t:=now+w;
         dfs(s1,t,w);
         s[dis[s1]]:=true;
     end;
     if (s2<>0) then begin
         s[dis[s2]]:=false;
         w:=k+abs(dis[p]-dis[s2]);
         t:=now+w;
         dfs(s2,t,w);
         s[dis[s2]]:=true;
     end;
     if (s2=0) and (s1=0) then
       if min>now then min:=now;
 end;

begin
    assign(input,'race.in'); reset(input);
    readln(n);
    i:=0;
    while i<n+1 do begin
        inc(i);
        read(dis[i]);
        if ((i=1) and (dis[i]>0)) or ((dis[i-1]<0) and (dis[i]>0)) then begin
            dis[i+1]:=dis[i];
            dis[i]:=0;
            v:=i;
            inc(i);
        end;
    end;
    inc(n);
    fillchar(s,sizeof(s),true);
    min:=maxlongint;
    s[dis[v]]:=false;
    dfs(v,0,0);
    writeln(min);
    close(input);
end.
