//Written on 6128 -- Feb 4, 2005
//Much remains to be optimized
program sqrroot;
const
  maxdigit=799;
type
  bignum=array[-1..maxdigit]of integer;
var
  ori,rt,sq,tsq:bignum;
  t,u,l,i,j,c:integer;
  s:ansistring;
function compare:shortint;
  var
    i:word;
  begin
    for i:=ori[-1] downto 0 do
      if sq[i]>ori[i] then begin
        compare:=1;exit;
      end
      else if sq[i]<ori[i] then begin
        compare:=-1;exit;
      end;
    compare:=0;
  end;
procedure add(x,y:word);
  var
    i:word;
  begin
    for i:=x+1 to l do
      inc(sq[i+x],rt[i]*2);
    inc(sq[x*2],y*2-1);
    for i:=x*2 to ori[-1]-1 do begin
      inc(sq[i+1],sq[i] div 10);
      sq[i]:=sq[i] mod 10;
    end;
  end;
procedure findroot;
  begin
    for i:=l downto 0 do
      for j:=1 to 9 do begin
        tsq:=sq;add(i,j);
        c:=compare;
        if c>0 then begin
          sq:=tsq;break;
        end;
        rt[i]:=j;
        if c=0 then exit;
      end;
  end;
begin
  readln(t);
  for u:=1 to t do begin
    fillchar(ori,sizeof(ori),0);
    fillchar(rt,sizeof(rt),0);
    fillchar(sq,sizeof(sq),0);
    readln(s);l:=length(s);
    ori[-1]:=l-ord(not odd(l));
    for i:=1 to l do
      ori[l-i]:=ord(s[i])-48;
    l:=(l-1) shr 1;
    findroot;
    for i:=l downto 0 do
      write(rt[i]);
    writeln;
  end;
end.
