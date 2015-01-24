program ural1212;
const
  maxl=30;
var
  x1,y1,x2,y2{Ships},u1,v1,u2,v2{Banned areas}:array[1..maxl]of integer;
  n,m,x,y:integer;
  l,i,k:byte;
  c:char;
  ans:longint;
procedure put(w,h:byte);
  var
    ok:boolean;
    i,j:byte;
    x,y:integer;
  begin
    dec(m,w-1);dec(n,h-1);
    if (m>0) and (n>0) then begin
      for i:=1 to l do begin
        u1[i]:=x1[i]-w;v1[i]:=y1[i]-h;
        u2[i]:=x2[i]+1;v2[i]:=y2[i]+1;
        if u1[i]<1 then u1[i]:=1;if v1[i]<1 then v1[i]:=1;
        if u2[i]>m then u2[i]:=m;if v2[i]>n then v2[i]:=n;
      end;
      inc(ans,m*n);
      for i:=1 to l do
        for x:=u1[i] to u2[i] do
          for y:=v1[i] to v2[i] do begin
            ok:=true;
            for j:=1 to i-1 do
              if (x>=u1[j]) and (x<=u2[j]) and (y>=v1[j]) and (y<=v2[j]) then begin
                ok:=false;
                break;
              end;
            if ok then dec(ans);
          end;
    end;
    inc(m,w-1);inc(n,h-1);
  end;
begin
  read(n,m,l);
  for i:=1 to l do begin
    read(x,y,k,c,c);
    x1[i]:=x;y1[i]:=y;
    if c='V' then begin
      x2[i]:=x;y2[i]:=y+k-1;
    end
    else begin
      x2[i]:=x+k-1;y2[i]:=y;
    end;
  end;
  read(k);

  put(1,k);
  if k>1 then put(k,1);

  writeln(ans);
end.
