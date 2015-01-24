program ural1200;
var
  a,b,ans:real;
  k,x,y,t,u:integer;
procedure update(p,q:integer);
  var
    m:real;
  begin
    m:=(a-p)*p+(b-q)*q;
    if m>ans then begin
      ans:=m;
      x:=p;y:=q;
    end;
  end;
begin
  read(a,b,k);ans:=-1;
  if a<0 then
    if b<0 then
      update(0,0)
    else if b/2>k then
      update(0,k)
    else begin
      update(0,trunc(b/2));
      update(0,trunc(b/2)+1);
    end
  else if b<0 then
    if a/2>k then
      update(k,0)
    else begin
      update(trunc(a/2),0);
      update(trunc(a/2)+1,0);
    end
  else if (a+b)/2>k then begin
    t:=trunc((a-b+k*2)/4);
    if t<0 then
      update(0,k)
    else if t>k then
      update(k,0)
    else begin
      update(t,k-t);
      update(t+1,k-t-1);
    end;
  end
  else begin
    t:=trunc(a/2);u:=trunc(b/2);
    update(t,u);
    update(t,u+1);
    update(t+1,u);
    update(t+1,u+1);
  end;
  if ans<1e-6 then writeln('0.00') else writeln(ans:0:2);
  {Sometimes there appears an annoying -0.00}
  writeln(x,' ',y);
end.
