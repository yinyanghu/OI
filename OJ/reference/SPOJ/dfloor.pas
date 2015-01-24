//Written on 6192 -- Apr 9, 2005
program dfloor;
const
  maxn=225;
var
  e:array[1..maxn,0..maxn]of boolean;
  w,h,i,j,k:byte;
  c:char;
  b:boolean;
procedure solve;
  begin
    for i:=h*w downto 1 do begin
      j:=i;while (j>0) and not e[j,i] do dec(j);
      if (j=0) and e[i,0] then begin
        b:=true;
        for k:=1 to i-1 do
          if e[i,k] then begin b:=false;break;end;
        if b then begin writeln(-1);exit;end;
      end;
      if (j>0) and (j<i) then
        for k:=0 to i do begin
          b:=e[i,k];e[i,k]:=e[j,k];e[j,k]:=b;
        end;
      for j:=1 to i-1 do
        if e[j,i] then
          for k:=0 to i-1 do
            e[j,k]:=e[j,k] xor e[i,k];
    end;

    j:=0;
    for i:=1 to h*w do begin
      if e[i,i] then
        for k:=1 to i-1 do
          if e[i,k] then e[i,0]:=e[i,0] xor e[k,0];
      if e[i,0] then inc(j);
    end;
    writeln(j);
    for i:=1 to w do
      for j:=1 to h do
        if e[(i-1)*h+j,0] then writeln(i,' ',j);
  end;
begin
  repeat
    readln(w,h);
    if w=0 then halt;
    fillchar(e,sizeof(e),0);
    for i:=1 to h do begin
      for j:=1 to w do begin
        k:=(j-1)*h+i;
        read(c);e[k,0]:=c='0';
        e[k,k]:=true;
        if i>1 then e[k,k-1]:=true;
        if i<h then e[k,k+1]:=true;
        if j>1 then e[k,k-h]:=true;
        if j<w then e[k,k+h]:=true;
      end;
      readln;
    end;
    solve;
  until false;
end.
