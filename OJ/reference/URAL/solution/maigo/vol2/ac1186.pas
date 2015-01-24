program ural1186;
type
  elemlist=array[1..26,0..26]of integer;
var
  left,right:elemlist;
  n,i:byte;
  mul:integer;
  s1,s2:string;
function isnum(c:char):boolean;
  begin
    if (c>='0') and (c<='9') then isnum:=true else isnum:=false;
  end;
function getnum(var s:string):integer;
  var
    x:integer;
  begin
    x:=0;
    repeat
      x:=x*10+ord(s[1])-48;
      delete(s,1,1);
    until not isnum(s[1]);
    getnum:=x;
  end;
function getbracket(var s:string):string;
  var
    p,b:byte;
  begin
    p:=1;b:=1;
    repeat
      inc(p);
      if s[p]='(' then inc(b) else if s[p]=')' then dec(b);
    until b=0;
    getbracket:=copy(s,2,p-2);
    delete(s,1,p);
  end;
procedure subst(var e:elemlist;s:string);
  var
    l1,l2:byte;
    c:integer;
    t:string;
  begin
    s:=s+' ';
    repeat
      if s[1]='(' then begin
        t:=getbracket(s);
        if isnum(s[1]) then c:=getnum(s) else c:=1;
        mul:=mul*c;
        subst(e,t);
        mul:=mul div c;
      end
      else begin
        l1:=ord(s[1])-64;delete(s,1,1);
        if (s[1]>='a') and (s[1]<='z') then begin
          l2:=ord(s[1])-96;delete(s,1,1);
        end
        else
          l2:=0;
        if isnum(s[1]) then c:=getnum(s) else c:=1;
        inc(e[l1,l2],mul*c);
      end;
    until s=' ';
  end;
procedure formula(var e:elemlist;s:string);
  var
    p,i,j:byte;
    t:string;
  begin
    fillchar(e,sizeof(e),0);
    s:=s+'+ ';
    repeat
      p:=pos('+',s);
      t:=copy(s,1,p-1);
      delete(s,1,p);
      if isnum(t[1]) then mul:=getnum(t) else mul:=1;
      subst(e,t);
    until s=' ';
  end;
function equal(a,b:elemlist):boolean;
  var
    i,j:byte;
  begin
    equal:=false;
    for i:=1 to 26 do
      for j:=0 to 26 do
        if a[i,j]<>b[i,j] then exit;
    equal:=true;
  end;
begin
  readln(s1);
  formula(left,s1);
  readln(n);
  for i:=1 to n do begin
    readln(s2);
    formula(right,s2);
    if equal(left,right) then writeln(s1,'==',s2) else writeln(s1,'!=',s2);
  end;
end.
