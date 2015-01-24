{This prog is a standard segment tree, but MLE.
 Yet I feel reluctant to desert it.}
program ural1019;
type
  pointer=^node;
  node=record
    l,r:longint;
    color:char;{w:white;b:black;2:both}
    lc,rc:pointer;
  end;
var
  root:pointer;
  n,i:word;
  x,y,z,l:longint;
  c:char;
function min(a,b:longint):longint;
  begin
    if a<b then min:=a else min:=b;
  end;
function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
procedure recycle(p:pointer);
  begin
    if p=nil then exit;
    recycle(p^.lc);recycle(p^.rc);
    dispose(p);
  end;
procedure cover(p:pointer;s,t:longint;c:char);
  var
    m:longint;
  begin
    if s>=t then exit;
    if p^.color=c then exit;
    if (s=p^.l) and (t=p^.r) then begin
      recycle(p^.lc);recycle(p^.rc);p^.lc:=nil;p^.rc:=nil;p^.color:=c;
    end
    else begin
      m:=(p^.l+p^.r) div 2;
      if p^.color<>'2' then begin
        new(p^.lc);with p^.lc^ do begin l:=p^.l;r:=m;color:=p^.color;lc:=nil;rc:=nil;end;
        new(p^.rc);with p^.rc^ do begin l:=m;r:=p^.r;color:=p^.color;lc:=nil;rc:=nil;end;
        p^.color:='2';
      end;
      cover(p^.lc,s,min(m,t),c);
      cover(p^.rc,max(m,s),t,c);
    end;
  end;
procedure stat(p:pointer);
  begin
    if p^.color='w' then
      y:=p^.r
    else if p^.color='b' then begin
      if y-x>l then begin
        l:=y-x;z:=x;
      end;
      x:=p^.r;
    end
    else begin
      stat(p^.lc);
      stat(p^.rc);
    end;
  end;
begin
  new(root);
  with root^ do begin
    l:=0;r:=1000000000;color:='w';lc:=nil;rc:=nil;
  end;

  read(n);
  for i:=1 to n do begin
    read(x,y,c,c);
    cover(root,x,y,c);
  end;

  l:=0;x:=0;
  stat(root);
  if y-x>l then begin l:=y-x;z:=x;end;

  writeln(z,' ',z+l);
end.
