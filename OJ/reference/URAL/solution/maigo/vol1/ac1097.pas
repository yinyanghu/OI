program ural1097;
const
  maxm=100;
var
  imp,size,x,y:array[0..maxm]of word;
  l,a,m,i,u,v,w:word;
function ok:boolean;
  var
    i,j,k,p,q:word;
  begin
    for i:=0 to m do
      if imp[i]>w then
        for j:=0 to m do
          if imp[j]>w then begin
            p:=x[i]+size[i];if p+a>l then continue;
            q:=y[j]+size[j];if q+a>l then continue;
            ok:=true;
            for k:=1 to m do
              if (imp[k]>w) and (p<x[k]+size[k]) and (x[k]<=p+a) and (q<y[k]+size[k]) and (y[k]<=q+a) then begin
                ok:=false;
                break;
              end;
            if ok then exit;
          end;
  end;
begin
  read(l,a,m);dec(a);
  for i:=1 to m do
    read(imp[i],size[i],x[i],y[i]);
  imp[0]:=255;size[0]:=1;x[0]:=0;y[0]:=0;

  u:=1;v:=101;
  repeat
    w:=(u+v) shr 1;
    if ok then v:=w else u:=w+1;
  until u=v;

  if u>100 then
    writeln('IMPOSSIBLE')
  else
    writeln(u);
end.
