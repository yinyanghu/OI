program ural1101;
const
  max=100;
  dx:array[1..4]of shortint=(1,0,-1,0);
  dy:array[1..4]of shortint=(0,1,0,-1);
var
  obj:array[-max..max,-max..max]of char;{Capitals for inverts, + for fork}
  reg:array['A'..'Z']of boolean;
  s:string;
  n,m,k,i,x,y,d:shortint;
  c:char;
function bool(s:string):boolean;
  var
    b,p:byte;
  begin
    {Delete outer brackets}
    while s[1]='(' do begin
      b:=1;
      for p:=2 to length(s)-1 do begin
        if (s[p]='(') then inc(b) else if (s[p]=')') then dec(b);
        if b=0 then break;
      end;
      if b=1 then s:=copy(s,2,length(s)-2) else break;
    end;

    {OR}
    b:=0;p:=0;
    repeat
      inc(p);
      if (s[p]='(') then inc(b) else if (s[p]=')') then dec(b);
    until (p>length(s)-3) or (b=0) and (copy(s,p,2)='OR');
    if copy(s,p,2)='OR' then begin
      bool:=bool(copy(s,1,p-1)) or bool(copy(s,p+2,length(s)-p-1));
      exit;
    end;

    {AND}
    b:=0;p:=0;
    repeat
      inc(p);
      if (s[p]='(') then inc(b) else if (s[p]=')') then dec(b);
    until (p>length(s)-4) or (b=0) and (copy(s,p,3)='AND');
    if copy(s,p,3)='AND' then begin
      bool:=bool(copy(s,1,p-1)) and bool(copy(s,p+3,length(s)-p-2));
      exit;
    end;

    {NOT}
    if copy(s,1,3)='NOT' then begin
      bool:=not bool(copy(s,4,length(s)-3));
      exit;
    end;

    {Single item}
    if s='TRUE' then
      bool:=true
    else if s='FALSE' then
      bool:=false
    else
      bool:=reg[s[1]];
  end;
begin
  fillchar(obj,sizeof(obj),0);
  fillchar(reg,sizeof(reg),0);
  readln(s);
  while pos(' ',s)>0 do
    delete(s,pos(' ',s),1);
  readln(n,m,k);
  for i:=1 to m do begin
    readln(x,y);
    obj[x,y]:='+';
  end;
  for i:=1 to k do begin
    readln(x,y,c,c);
    obj[x,y]:=c;
  end;

  x:=0;y:=0;d:=1;
  repeat
    writeln(x,' ',y);
    if obj[x,y]>='A' then
      reg[obj[x,y]]:=not reg[obj[x,y]]
    else if obj[x,y]='+' then
      if bool(s) then begin
        dec(d);if d=0 then d:=4;
      end
      else begin
        inc(d);if d=5 then d:=1;
      end;
    inc(x,dx[d]);inc(y,dy[d]);
  until (abs(x)>n) or (abs(y)>n);
end.
