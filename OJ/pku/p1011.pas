program p1011; //good DFS problem
var n,i,l,max,total,res,w:longint;
    ok:array[1..65] of boolean;
    a:array[1..65] of longint;
    find:boolean;
procedure sort;
 var i,j,k:longint;
 begin
     for i:=1 to n-1 do
       for j:=i+1 to n do
         if a[i]<a[j] then begin
             k:=a[i]; a[i]:=a[j]; a[j]:=k;
         end;
 end;

procedure dfs(now,rest,level:longint);
 var i,j:longint;
 begin
     if find or (now>res) then begin
         find:=true;
         exit;
     end;
     i:=level;
     while i<=n do begin
         if (ok[i]) and (rest>=a[i]) then begin
             if (n-w+1<res-now) then exit;
             ok[i]:=false;
             inc(w);
             if rest-a[i]=0 then dfs(now+1,l,1)
               else dfs(now,rest-a[i],i+1);
             if find then exit;
             ok[i]:=true;
             dec(w);
             if rest=l then exit; //very important
             if i<>n then begin
                j:=i;
                for i:=j+1 to n do if a[i]<>a[j] then break;
             end else exit;
         end else inc(i);
         if find then exit;
     end;
 end;

procedure work;
 begin
     if total mod res<>0 then exit;
     l:=total div res;
     if max>l then exit;
     w:=0;
     dfs(1,l,1);
 end;

begin
    read(n);
    while n<>0 do begin
        total:=0; max:=0;
        for i:=1 to n do begin
            read(a[i]);
            total:=total+a[i];
            if a[i]>max then max:=a[i];
        end;
        fillchar(ok,sizeof(ok),true);
        sort;
        for res:=n downto 1 do begin
            find:=false;
            work;
            if find then break;
        end;
        writeln(l);
        read(n);
    end;
end.
