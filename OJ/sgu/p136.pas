program p136;
type node=record
         x,y:double;
     end;
var i,n,k:longint;
    a:array [1..10000] of node;
    p,q:double;
    f:node;
begin
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    p:=a[n].x; q:=a[n].y;
    k:=-1;
    if (n mod 2=0) then k:=1;
    for i:=n-1 downto 1 do begin
        p:=a[i].x-p;
        q:=a[i].y-q;
    end;
    if (k>0) and ((p<>0) or (q<>0)) then begin
        writeln('NO');
        halt;
    end;
    if k>0 then begin
       f.x:=-1; f.y:=1;
    end else begin
        f.x:=p;
        f.y:=q;
    end;
    writeln('YES');
    writeln(f.x:0:3,' ',f.y:0:3);
    for i:=2 to n do begin
        f.x:=a[i-1].x*2-f.x;
        f.y:=a[i-1].y*2-f.y;
        writeln(f.x:0:3,' ',f.y:0:3);
    end;
end.