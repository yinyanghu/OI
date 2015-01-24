{$Q-,R-}
program ural1163;
const
  r=0.8;
  zero=1e-6;
var
  e:array[1..16]of word;
  x,y:array[1..16]of real;
  angle:array[1..30]of real;
  flag:array[1..30]of shortint;
  mask:array[1..16,1..30]of word;
  win:array[1..2,0..65535]of boolean;
  i,j,k,c,p,s:longint;
  alpha,beta,t:real;
function look(x1,y1,x2,y2:real):real;
  var
    a:real;
  begin
    if abs(x1-x2)<zero then
      if y2>y1 then look:=pi/2 else look:=pi*3/2
    else begin
      a:=arctan((y1-y2)/(x1-x2));
      if x1>x2 then
        look:=a+pi
      else if y1>y2 then
        look:=a+pi*2
      else
        look:=a;
    end;
  end;
begin
  e[1]:=1;for i:=2 to 16 do e[i]:=e[i-1]*2;

  for i:=1 to 16 do read(x[i],y[i]);

  for i:=1 to 16 do begin
    c:=0;s:=0;
    for j:=1 to 16 do
      if i<>j then begin
        alpha:=look(x[i],y[i],x[j],y[j]);
        beta:=arctan(r/sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j])-r*r));
        inc(c);flag[c]:=-j;
        angle[c]:=alpha-beta;if angle[c]<0 then angle[c]:=angle[c]+pi*2;
        inc(c);flag[c]:=j;
        angle[c]:=alpha+beta;if angle[c]>pi*2 then angle[c]:=angle[c]-pi*2;
        if angle[c-1]<angle[c] then inc(s,e[j]);
      end;
    for j:=1 to c-1 do
      for k:=j+1 to c do
        if (angle[j]-angle[k]>zero) or (abs(angle[j]-angle[k])<zero) and (flag[j]>flag[k]) then begin
          t:=angle[j];angle[j]:=angle[k];angle[k]:=t;
          p:=flag[j];flag[j]:=flag[k];flag[k]:=p;
        end;
    for j:=1 to c do begin
      mask[i,j]:=s;
      if flag[j]>0 then inc(s,e[flag[j]]) else dec(s,e[-flag[j]]);
    end;
  end;

  for s:=0 to 65535 do begin
    for i:=1 to 8 do begin
      if s and e[i]>0 then
        for j:=1 to 30 do
          if not win[2,s and mask[i,j]] then begin
            win[1,s]:=true;break;
          end;
      if win[1,s] then break;
    end;
    for i:=9 to 16 do begin
      if s and e[i]>0 then
        for j:=1 to 30 do
          if not win[1,s and mask[i,j]] then begin
            win[2,s]:=true;break;
          end;
      if win[2,s] then break;
    end;
  end;

  if win[1,65535] then writeln('RED') else writeln('WHITE');
end.
