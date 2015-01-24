program ural1037;
const
  n=30000;
  t=600;
var
  free,busy,bpos,start:array[1..n]of word;
  sf,sb,time,i:longint;
  c:char;
procedure insfree(x:word);
  var
    p:word;
  begin
    inc(sf);p:=sf;
    while (p>1) and (x<free[p shr 1]) do begin
      free[p]:=free[p shr 1];p:=p shr 1;
    end;
    free[p]:=x;
  end;
procedure insbusy(x:word);
  var
    p:word;
  begin
    inc(sb);p:=sb;
    while (p>1) and (start[x]<start[busy[p shr 1]]) do begin
      busy[p]:=busy[p shr 1];bpos[busy[p]]:=p;p:=p shr 1;
    end;
    busy[p]:=x;bpos[x]:=p;
  end;
procedure delfree;
  var
    x,p,l,r:word;
  begin
    x:=free[sf];dec(sf);p:=1;
    repeat
      l:=p*2;r:=l+1;
      if (r<=sf) and (free[r]<x) and (free[r]<=free[l]) then begin
        free[p]:=free[r];p:=r;
      end
      else if (l<=sf) and (free[l]<x) then begin
        free[p]:=free[l];p:=l;
      end
      else
        break;
    until false;
    free[p]:=x;
  end;
procedure downbusy(p:word);
  var
    x,l,r:word;
  begin
    x:=busy[p];
    repeat
      l:=p*2;r:=l+1;
      if (r<=sb) and (start[busy[r]]<start[x]) and (start[busy[r]]<=start[busy[l]]) then begin
        busy[p]:=busy[r];bpos[busy[p]]:=p;p:=r;
      end
      else if (l<=sb) and (start[busy[l]]<start[x]) then begin
        busy[p]:=busy[l];bpos[busy[p]]:=p;p:=l;
      end
      else
        break;
    until false;
    busy[p]:=x;bpos[x]:=p;
  end;
procedure delbusy;
  begin
    bpos[busy[1]]:=0;
    busy[1]:=busy[sb];dec(sb);
    if sb>0 then downbusy(1);
  end;
begin
  for i:=1 to n do free[i]:=i;sf:=n;sb:=0;
  repeat
    read(time,c,c);
    while (sb>0) and (start[busy[1]]+t<=time) do begin
      insfree(busy[1]);
      delbusy;
    end;
    case c of
      '+':begin
            readln;
            writeln(free[1]);
            start[free[1]]:=time;
            insbusy(free[1]);
            delfree;
          end;
      '.':begin
            readln(i);
            if bpos[i]=0 then writeln('-') else begin
              writeln('+');
              start[i]:=time;
              downbusy(bpos[i]);
            end;
          end;
    end;
  until seekeof;
end.
