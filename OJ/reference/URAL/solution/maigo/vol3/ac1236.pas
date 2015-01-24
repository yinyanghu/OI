program ural1236;
var
  s1,s2:ansistring;
  key:string[2];
function h2d(c:char):byte;
  begin
    if c<'A' then h2d:=ord(c)-48 else h2d:=ord(c)-55;
  end;
function d2h(x:byte):char;
  begin
    if x>9 then d2h:=chr(55+x) else d2h:=chr(48+x);
  end;
function chrxor(a,b:char):char;
  begin
    chrxor:=d2h(h2d(a) xor h2d(b));
  end;
function strxor(a,b:string[2]):string[2];
  begin
    strxor:=chrxor(a[1],b[1])+chrxor(a[2],b[2]);
  end;
begin
  readln(s1);readln(s2);
  key:=strxor(copy(s2,1,2),'20');
  write(key);
  delete(s2,1,2);
  repeat
    key:=strxor(strxor(key,copy(s1,1,2)),copy(s2,1,2));
    write(key);
    delete(s1,1,2);
    delete(s2,1,2);
  until s1='';
  writeln;
end.
