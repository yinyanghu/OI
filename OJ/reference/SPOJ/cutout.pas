//Written on 6154 -- Mar 2, 2005
program cutout;
const
  maxr=100;
type
  segment=record y,l,r:word;d:shortint;end;
var
  s,e:array[0..maxr]of word;
  seg:array[0..maxr*2+1]of segment;
  d,u,n,r,i,j,k,w,l,h,t,ans:longint;
procedure qsort(s,t:byte);
  var
    i,j,p:byte;
    tseg:segment;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tseg:=seg[p];seg[p]:=seg[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (seg[j].y>tseg.y) do dec(j);
      if i=j then break;seg[i]:=seg[j];inc(i);
      while (i<j) and (seg[i].y<tseg.y) do inc(i);
      if i=j then break;seg[j]:=seg[i];dec(j);
    until i=j;
    seg[i]:=tseg;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(d);
  for u:=1 to d do begin
    read(n,r);
    s[0]:=0;e[0]:=n;
    with seg[0] do begin y:=0;l:=0;r:=n;d:=-1;end;
    with seg[r*2+1] do begin y:=n;l:=0;r:=n;d:=1;end;
    for i:=1 to r do begin
      read(e[i],s[i]);
      with seg[i*2-1] do begin read(y);l:=e[i];r:=s[i];d:=1;end;
      with seg[i*2] do begin read(y);l:=e[i];r:=s[i];d:=-1;end;
    end;
    qsort(1,r*2);

    ans:=0;
    for i:=0 to r do
      for j:=0 to r do
        if s[i]<e[j] then begin
          w:=e[j]-s[i];l:=0;h:=0;
          for k:=1 to r*2+1 do
            if (seg[k].l<e[j]) and (seg[k].r>s[i]) then begin
              if h=0 then begin t:=(seg[k].y-l)*w;if t>ans then ans:=t;end;
              inc(h,seg[k].d);
              if h=0 then l:=seg[k].y;
            end;
        end;
    writeln(ans);
  end;
end.
