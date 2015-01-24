//Written on 6154 -- Mar 2, 2005
program roman;
const
  digit:array[1..9]of string=('ONE','TWO','THREE','FOUR','FIVE','SIX','SEVEN','EIGHT','NINE');
  c1='IXCIXCixcixc';
  c5='VLDVLDvldvld';
  c10='XCMXCMxcmxcm';
  over='   ___   ___';
var
  n,i,x,d,t,j:cardinal;
  s1,s2:string;
function getdigit:byte;
  var
    i:byte;
    c:char;
    s:string;
  begin
    s:='';
    repeat
      read(c);
      if c=' ' then break;
      s:=s+c;
    until eoln;
    for i:=1 to 9 do
      if s=digit[i] then begin
        getdigit:=i;exit;
      end;
    getdigit:=0;
  end;
procedure getnum(var x:cardinal);
  begin
    x:=0;
    repeat
      x:=x*10+getdigit;
    until seekeoln;
    readln;
  end;
begin
  getnum(n);
  for i:=1 to n do begin
    s1:='';s2:='';
    getnum(x);d:=0;
    repeat
      inc(d);t:=x mod 10;x:=x div 10;
      if (d in [4,7,10]) and (t<4) then begin
        for j:=1 to t do s1:=over[d-1]+s1;
        for j:=1 to t do s2:=c10[d-1]+s2;
      end
      else if t=4 then begin
        s1:=over[d]+over[d]+s1;
        s2:=c1[d]+c5[d]+s2;
      end
      else if t=9 then begin
        s1:=over[d]+over[d]+s1;
        s2:=c1[d]+c10[d]+s2;
      end
      else begin
        for j:=1 to t mod 5 do begin s1:=over[d]+s1;s2:=c1[d]+s2;end;
        if t>4 then begin s1:=over[d]+s1;s2:=c5[d]+s2;end;
      end;
    until x=0;
    writeln(s1);writeln(s2);
  end;
end.
