program p1088;
var a,s:array[1..100,1..100] of longint;
    r,c,i,j,k,max:longint;
function dfs(x,y:longint):longint;
 var temp,max:longint;
 begin
     if s[x,y]<>-1 then exit(s[x,y]);
     max:=1;
     if (x>1) and (a[x,y]>a[x-1,y]) then begin
         temp:=dfs(x-1,y);
         if temp+1>max then max:=temp+1;
     end;
     if (y>1) and (a[x,y]>a[x,y-1]) then begin
         temp:=dfs(x,y-1);
         if temp+1>max then max:=temp+1;
     end;
     if (x<r) and (a[x,y]>a[x+1,y]) then begin
         temp:=dfs(x+1,y);
         if temp+1>max then max:=temp+1;
     end;
     if (y<c) and (a[x,y]>a[x,y+1]) then begin
         temp:=dfs(x,y+1);
         if temp+1>max then max:=temp+1;
     end;
     s[x,y]:=max;
     dfs:=max;
 end;

begin
    readln(r,c);
    for i:=1 to r do
      for j:=1 to c do begin
          read(a[i,j]);
          s[i,j]:=-1;
      end;
    max:=0;
    for i:=1 to r do
      for j:=1 to c do begin
          k:=dfs(i,j);
          if k>max then max:=k;
      end;
    writeln(max);
end.