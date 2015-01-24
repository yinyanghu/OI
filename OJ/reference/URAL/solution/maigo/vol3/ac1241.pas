program ural1241;
const
  maxm=50;
  maxn=50;
  maxk=296;
type
  int1=array[0..maxk+2]of integer;
  int2=array[-maxn*2..(maxm+maxn)*2]of integer;
  bool=array[-maxn*2..(maxm+maxn)*2]of boolean;
var
  heng,shu,pie,na:int1;
  eh,es,ep,en:bool;
  ph,ps,pp,pn,nh,ns,np,nn:int2;
  m,n,k,i,j,x1,y1,x2,y2,ans:integer;
procedure sort(var a:int1);
  var
    i,j,t:integer;
  begin
    for i:=1 to a[0]-1 do
      for j:=i+1 to a[0] do
        if a[i]>a[j] then begin
          t:=a[i];a[i]:=a[j];a[j]:=t;
        end;
  end;
procedure cal(a:int1;var e:bool;var p,n:int2);
  var
    i:integer;
  begin
    for i:=1 to a[0] do
      e[a[i]]:=true;
    for i:=a[1]+1 to a[a[0]] do
      if e[i-1] then p[i]:=1 else p[i]:=p[i-1]+1;
    for i:=a[a[0]]-1 downto a[1] do
      if e[i+1] then n[i]:=1 else n[i]:=n[i+1]+1;
  end;
begin
  read(m,n,k);m:=m*2;n:=n*2;
  heng[0]:=2;heng[1]:=0;heng[2]:=n;
  shu[0]:=2;shu[1]:=0;shu[2]:=m;
  pie[0]:=2;pie[1]:=-n;pie[2]:=m;
  na[0]:=2;na[1]:=0;na[2]:=m+n;
  for i:=1 to k do begin
    read(x1,y1,x2,y2);
    if y1=y2 then begin
      inc(heng[0]);
      heng[heng[0]]:=y1*2;
    end
    else if x1=x2 then begin
      inc(shu[0]);
      shu[shu[0]]:=x1*2;
    end
    else if x1-y1=x2-y2 then begin
      inc(pie[0]);
      pie[pie[0]]:=(x1-y1)*2;
    end
    else begin
      inc(na[0]);
      na[na[0]]:=(x1+y1)*2;
    end;
  end;

  sort(heng);cal(heng,eh,ph,nh);
  sort(shu);cal(shu,es,ps,ns);
  sort(pie);cal(pie,ep,pp,np);
  sort(na);cal(na,en,pn,nn);

  for i:=1 to heng[0] do
    for j:=1 to shu[0] do begin
      x1:=shu[j];y1:=heng[i];
      if not ep[x1-y1] then begin
        {Up right}
        if (x1<m) and (y1<n) and
           (nn[x1+y1]<=nh[y1]) and
           (nn[x1+y1]<=ns[x1]) and
           (nn[x1+y1]<=pp[x1-y1]) and
           (nn[x1+y1]<=np[x1-y1]) then inc(ans);
        {Down left}
        if (x1>0) and (y1>0) and
           (pn[x1+y1]<=ph[y1]) and
           (pn[x1+y1]<=ps[x1]) and
           (pn[x1+y1]<=pp[x1-y1]) and
           (pn[x1+y1]<=np[x1-y1]) then inc(ans);
      end;
      if not en[x1+y1] then begin
        {Down right}
        if (x1<m) and (y1>0) and
           (np[x1-y1]<=ph[y1]) and
           (np[x1-y1]<=ns[x1]) and
           (np[x1-y1]<=pn[x1+y1]) and
           (np[x1-y1]<=nn[x1+y1]) then inc(ans);
        {Up left}
        if (x1>0) and (y1<n) and
           (pp[x1-y1]<=nh[y1]) and
           (pp[x1-y1]<=ps[x1]) and
           (pp[x1-y1]<=pn[x1+y1]) and
           (pp[x1-y1]<=nn[x1+y1]) then inc(ans);
      end;
    end;

  for i:=1 to pie[0] do
    for j:=1 to na[0] do begin
      x1:=(pie[i]+na[j]) div 2;y1:=(na[j]-pie[i]) div 2;
      if (x1<0) or (x1>m) or (y1<0) or (y1>n) then continue;
      if not es[x1] then begin
        {Up}
        if (y1<n) and
           (nh[y1]<=ps[x1]) and
           (nh[y1]<=ns[x1]) and
           (nh[y1]*2<=pp[x1-y1]) and
           (nh[y1]*2<=nn[x1+y1]) then inc(ans);
        {Down}
        if (y1>0) and
           (ph[y1]<=ps[x1]) and
           (ph[y1]<=ns[x1]) and
           (ph[y1]*2<=np[x1-y1]) and
           (ph[y1]*2<=pn[x1+y1]) then inc(ans);
      end;
      if not eh[y1] then begin
        {Left}
        if (x1>0) and
           (ps[x1]<=ph[y1]) and
           (ps[x1]<=nh[y1]) and
           (ps[x1]*2<=pp[x1-y1]) and
           (ps[x1]*2<=pn[x1+y1]) then inc(ans);
        {Right}
        if (x1<m) and
           (ns[x1]<=ph[y1]) and
           (ns[x1]<=nh[y1]) and
           (ns[x1]*2<=np[x1-y1]) and
           (ns[x1]*2<=nn[x1+y1]) then inc(ans);
      end;
    end;

  writeln(ans);
end.
