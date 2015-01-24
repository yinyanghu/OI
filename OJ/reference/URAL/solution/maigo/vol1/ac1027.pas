program ural1027;
const
  arith='=+-*/0123456789';
var
  pro,s:string;
  i:byte;
  brac:integer;
  comment,finish:boolean;
procedure fail;
  begin
    writeln('NO');
    halt;
  end;
begin
  pro:='';finish:=false;
  brac:=0;comment:=false;
  repeat
    if length(pro)<=1 then
      if eof then begin
        finish:=true;
        pro:=pro+' ';
      end
      else begin
        readln(s);
        pro:=pro+s;
      end;
    if copy(pro,1,2)='(*' then begin
      comment:=true;delete(pro,1,2);
    end
    else if comment and (copy(pro,1,2)='*)') then begin
      comment:=false;delete(pro,1,2);
    end
    else begin
      if not comment then
        if pro[1]='(' then
          inc(brac)
        else if pro[1]=')' then
          if brac>0 then dec(brac) else fail
        else if brac>0 then
          if pos(pro[1],arith)=0 then fail;
      delete(pro,1,1);
    end;
  until finish;
  if (brac>0) or comment then fail;
  writeln('YES');
end.
