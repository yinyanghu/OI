program p1033;
const dx:array[1..4] of integer=(1,-1,0,0);
      dy:array[1..4] of integer=(0,0,1,-1);
var g:array[0..34,0..34] of char;
    v:array[1..33,1..33] of boolean;
    qx,qy:array[1..33*33] of longint;
    n,i,j,x,y,f,r,s:longint;
begin
    readln(n);
    for i:=1 to n do begin
        g[0,i]:='#';
        g[i,0]:='#';
        g[n+1,i]:='#';
        g[i,n+1]:='#';
    end;
    for i:=1 to n do begin
        for j:=1 to n do read(g[i,j]);
        readln;
    end;
    fillchar(v,sizeof(v),false);
    f:=0; r:=2;
    qx[1]:=1; qy[1]:=1; v[1,1]:=true;
    qx[2]:=n; qy[2]:=n; v[n,n]:=true;
    s:=0;
    repeat
       inc(f);
       for i:=1 to 4 do begin
           x:=qx[f]+dx[i];
           y:=qy[f]+dy[i];
           if g[x,y]='#' then inc(s)
             else if not v[x,y] then begin
                 inc(r);
                 qx[r]:=x;
                 qy[r]:=y;
                 v[x,y]:=true;
             end;
       end;
    until f=r;
    writeln((s-4)*9);
end.