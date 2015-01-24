var
  o:array[1..200] of longint;
  a,c,d,i,time,j,t,k,s,max,m,n,s1,s2:longint;
  w1,w2:array[-200..200,1..200] of longint;
  b,p,tt:array[1..200,1..200] of longint;
  procedure make;
  var
    semp:longint;
  begin
    for a:=0 to max do
    begin
      semp:=0;
      for c:=1 to n do
      semp:=semp+b[a,c];
      for c:=1 to n do
        for d:=1 to o[c] do
        begin
          if w1[a,c]<w1[a-tt[c,p[c,d]],p[c,d]]+b[a,c] then
          w1[a,c]:=b[a,c]+w1[a-tt[c,p[c,d]],p[c,d]];
          if w2[a,c]<w1[a-tt[c,p[c,d]],p[c,d]]+semp then
          w2[a,c]:=w1[a-tt[c,p[c,d]],p[c,d]]+semp;
          if w2[a,c]<w2[a-tt[c,p[c,d]],p[c,d]]+b[a,c] then
          w2[a,c]:=w2[a-tt[c,p[c,d]],p[c,d]]+b[a,c];
        end;
    end;
  end;
begin
  fillchar(b,sizeof(b),0);
  assign(input,'moles.in');
  reset(input);{output.out}
  read(n,m,t); {moles.out}
  for a:=1 to n do
  begin
    o[a]:=1;
    p[a,1]:=a;
    tt[a,a]:=1;
    tt[a,a]:=1;
  end;
  for a:=1 to m do
  begin
    read(i,j,t);
    o[i]:=o[i]+1;
    o[j]:=o[j]+1;
    p[i,o[i]]:=j;
    p[j,o[j]]:=i;
    tt[i,j]:=t;
    tt[j,i]:=t;
  end;
  read(time,k,s);
  max:=0;
  while k<>0 do
  begin
    b[time,k]:=s;
    read(time,k,s);
    if time>max then max:=time;
  end;
  fillchar(w1,sizeof(w1),0);
  fillchar(w2,sizeof(w2),0);
  assign(output,'moles.out');
  rewrite(output);
  make;
  s2:=0;
  s1:=0;
  for a:=1 to n do
  begin
    if w2[max,a]>s2 then
    s2:=w2[max,a];
    if w1[max,a]>s1 then
    s1:=w1[max,a];
  end;
  writeln(s2,' ',s1);
  close(output);
end.
