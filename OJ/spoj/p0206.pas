program p0206;
const maxsize=182;
      dx:array[1..4] of shortint=(0,0,1,-1);
      dy:array[1..4] of shortint=(1,-1,0,0);
var dist:array[1..maxsize,1..maxsize] of word;
    qx,qy:array[1..sqr(maxsize)] of byte;
    t,u,n,m,i,j,f,r,d,x,y:word;
    c:char;
begin
    read(t);
    for u:=1 to t do begin
        fillchar(dist,sizeof(dist),255);
        readln(n,m);
        f:=0; r:=0;
        for i:=1 to n do begin
           for j:=1 to m do begin
                read(c);
                if c='1' then begin
                    inc(r);
                    qx[r]:=i; qy[r]:=j;
                    dist[i,j]:=0;
                end;
            end;
            readln;
        end;
        repeat
           inc(f);
           for d:=1 to 4 do begin
               x:=qx[f]+dx[d];
               y:=qy[f]+dy[d];
               if (x>0) and (x<=n) and (y>0) and (y<=m) and (dist[x,y]=65535) then begin
                   inc(r);
                   qx[r]:=x; qy[r]:=y;
                   dist[x,y]:=dist[qx[f],qy[f]]+1;
               end;
           end;
        until r=n*m;
        for i:=1 to n do
          for j:=1 to m do begin
              write(dist[i,j]);
              if j=m then writeln else write(' ');
          end;
    end;
end.