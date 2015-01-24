//Written on 6193 -- Apr 10, 2005
program pour1;
const
  maxn=40000;
var
  qx:array[1..maxn*4]of byte;
  qy:array[1..maxn*4]of word;
  dist:array[0..3,0..maxn]of cardinal;
    {0:a is empty;1:a is full;2:b is empty;3:b is full}
  t,u,a,b,c,f,r,y,z:longint;
  succeed:boolean;
function gcd(a,b:word):word;
  var
    t:word;
  begin
    if a<b then begin t:=a;a:=b;b:=t;end;
    repeat
      t:=a mod b;a:=b;b:=t;
    until b=0;
    gcd:=a;
  end;
procedure ins(x,y,z:longint);
  begin
    if z<dist[x,y] then begin
      inc(r);qx[r]:=x;qy[r]:=y;dist[x,y]:=z;
      if y=c then succeed:=true;
    end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(a,b,c);
    if (c>a) and (c>b) or (c mod gcd(a,b)>0) then begin
      writeln(-1);continue;
    end;
    fillchar(dist,sizeof(dist),255);
    succeed:=false;
    f:=0;r:=0;ins(0,b,1);ins(1,0,1);ins(2,a,1);ins(3,0,1);
    while not succeed do begin
      inc(f);y:=qy[f];z:=dist[qx[f],y]+1;
      case qx[f] of
        0:begin
            ins(1,y,z);
            if y>=a then ins(1,y-a,z);
            if y<=a then ins(2,y,z);
          end;
        1:begin
            ins(0,y,z);
            if a>=b-y then ins(3,a+y-b,z);
            if a<=b-y then ins(0,y+a,z);
          end;
        2:begin
            ins(3,y,z);
            if y>=b then ins(3,y-b,z);
            if y<=b then ins(0,y,z);
          end;
        3:begin
            ins(2,y,z);
            if b>=a-y then ins(1,b+y-a,z);
            if b<=a-y then ins(2,y+b,z);
          end;
      end;
    end;
    writeln(dist[qx[r],qy[r]]);
  end;
end.
