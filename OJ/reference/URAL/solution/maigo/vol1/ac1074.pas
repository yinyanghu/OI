program ural1074;
const
  maxlen=200;
  digit=['0'..'9'];
  nonzero=['1'..'9'];
  sign=['+','-'];
var
  d:array[-maxlen..maxlen]of char;
  s:string;
  n,p,e,i,junk:longint;
  minus,allzero:boolean;
procedure error;
  begin
    writeln('Not a floating point number');
  end;
function is_unsigned_int(s:string):boolean;
  var
    i:byte;
  begin
    is_unsigned_int:=false;
    if s='' then exit;
    for i:=1 to length(s) do
      if not (s[i] in digit) then exit;
    is_unsigned_int:=true;
  end;
function is_int(s:string):boolean;
  begin
    if s='' then begin is_int:=false;exit;end;
    if s[1] in sign then
      is_int:=is_unsigned_int(copy(s,2,length(s)-1))
    else
      is_int:=is_unsigned_int(s);
  end;
function is_unsigned_real(s:string):boolean;
  var
    p:byte;
  begin
    p:=pos('.',s);
    if p=0 then
      is_unsigned_real:=is_unsigned_int(s)
    else if p=1 then
      is_unsigned_real:=is_unsigned_int(copy(s,2,length(s)-1))
    else
      is_unsigned_real:=is_unsigned_int(copy(s,1,p-1)) and
                        is_unsigned_int(copy(s,p+1,length(s)-p));
  end;
function is_real(s:string):boolean;
  begin
    if s='' then begin is_real:=false;exit;end;
    if s[1] in sign then
      is_real:=is_unsigned_real(copy(s,2,length(s)-1))
    else
      is_real:=is_unsigned_real(s);
  end;
begin
  repeat
    readln(s);if s='#' then halt;readln(n);
    p:=pos('E',s);if p=0 then p:=pos('e',s);
    if p>0 then begin
      if is_int(copy(s,p+1,length(s)-p)) then begin
        val(copy(s,p+1,length(s)-p),e,junk);
        s:=copy(s,1,p-1);
      end
      else begin
        error;
        continue;
      end;
    end
    else
      e:=0;

    if not is_real(s) then begin
      error;
      continue;
    end;

    minus:=s[1]='-';
    if s[1] in sign then delete(s,1,1);
    fillchar(d,sizeof(d),'0');
    p:=pos('.',s);if p=0 then begin s:=s+'.';p:=length(s);end;
    i:=e;
    while p>1 do begin
      dec(p);d[i]:=s[p];inc(i);
    end;
    p:=pos('.',s);i:=e;
    while (p<length(s)) and (i>-maxlen) do begin
      inc(p);dec(i);d[i]:=s[p];
    end;

    s:='';allzero:=true;
    for i:=maxlen downto -n do begin
      if i=-1 then s:=s+'.';
      if not ((d[i]='0') and (i>0) and (s='')) then s:=s+d[i];
      if s[length(s)]>'0' then allzero:=false;
    end;
    if minus and not allzero then write('-');
    writeln(s);
  until false;
end.
