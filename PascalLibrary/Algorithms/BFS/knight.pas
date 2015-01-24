program knight;
const dx:array[1..8] of -2..2=(1,2,2,1,-1,-2,-2,-1);
      dy:array[1..8] of -2..2=(-2,-1,1,2,2,1,-1,-2);
var n,x,y,k,i,j,p:longint;
    h:array[1..100,1..100] of longint;
    t:array[1..100] of longint;
begin
    readln(n);
    for i:=1 to n*n do t[i]:=0;
    fillchar(h,sizeof(h),0);
    readln(x,y);
    p:=1; k:=0; h[x,y]:=p;
    repeat
       inc(k);
       if k<9 then begin
           i:=x+dx[k]; j:=y+dy[k];
           if (i>0) and (i<=n) and (j>0) and (j<=n) and (h[i,j]=0) then begin
               x:=i; y:=j; inc(p); h[x,y]:=p;
               t[p]:=k; k:=0;
           end;
       end else begin
           h[x,y]:=0; k:=t[p]; dec(p);
           x:=x-dx[k]; y:=y-dy[k];
       end;
    until (p=0) or (p=n*n);
    if p=0 then writeln('No Solution!')
      else for i:=1 to n do begin
          for j:=1 to n do write(h[i,j]:3);
          writeln;
      end;
    readln;
end.