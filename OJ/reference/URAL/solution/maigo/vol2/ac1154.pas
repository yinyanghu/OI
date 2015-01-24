program ural1154;
var
  pt,wt:array[1..4]of longint;
  pm,wm:array[1..4]of word;
  c:array[1..4]of integer;
  best:real;
  bt:longint;
  i:byte;
  ch:char;
function num(c:char):byte;
  begin
    case c of
      'A':num:=1;
      'E':num:=2;
      'F':num:=3;
      'W':num:=4;
    end;
  end;
function maketime(a,b,c,d,e,f:char):longint;
  var
    h1,h2,m1,m2,s1,s2:byte;
  begin
    h1:=ord(a)-48;h2:=ord(b)-48;m1:=ord(c)-48;m2:=ord(d)-48;s1:=ord(e)-48;s2:=ord(f)-48;
    maketime:=(h1*10+h2)*3600+(m1*10+m2)*60+s1*10+s2;
  end;
procedure readline;
  var
    x,y:byte;
    h1,h2,m1,m2,s1,s2:char;
  begin
    read(ch);
    x:=num(ch);
    read(ch,h1,h2,ch,m1,m2,ch,s1,s2);
    pt[x]:=maketime(h1,h2,m1,m2,s1,s2);
    read(pm[x]);
    read(ch,h1,h2,ch,m1,m2,ch,s1,s2);
    wt[x]:=maketime(h1,h2,m1,m2,s1,s2);
    readln(wm[x]);
  end;
function pow(x:byte;t:longint):real;
  var
    a,b:longint;
  begin
    a:=pt[x];b:=wt[x];
    if (t<a) and (t<b) then
      if a<b then dec(b,86400) else dec(a,86400)
    else if (t>a) and (t>b) then
      if a<b then inc(a,86400) else inc(b,86400);
    pow:=(pm[x]*abs(t-b)+wm[x]*abs(t-a))/abs(a-b);
  end;
procedure contest(t:longint);
  var
    win:real;
    i:byte;
  begin
    win:=0;
    for i:=1 to 4 do
      win:=win+pow(i,t)*c[i];
    if (win>best) or (win=best) and (t<bt) then begin
      best:=win;bt:=t;
    end;
  end;
begin
  for i:=1 to 4 do
    readline;
  fillchar(c,sizeof(c),0);
  repeat
    read(ch);
    inc(c[num(ch)]);
  until eoln;
  readln;
  repeat
    read(ch);
    dec(c[num(ch)]);
  until eoln;

  best:=0;bt:=0;
  for i:=1 to 4 do begin
    contest(pt[i]);
    contest(wt[i]);
  end;
  contest(0);{DON'T FORGET THIS! The time 00:00:00 can be on a flat segment}

  if best=0 then
    writeln('We can''t win!')
  else begin
    write(bt div 36000);bt:=bt mod 36000;
    write(bt div 3600,':');bt:=bt mod 3600;
    write(bt div 600);bt:=bt mod 600;
    write(bt div 60,':');bt:=bt mod 60;
    write(bt div 10);bt:=bt mod 10;
    writeln(bt);
    writeln(best:0:2);
  end;
end.
