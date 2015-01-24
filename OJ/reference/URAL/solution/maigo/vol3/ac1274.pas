program ural1274;
var
  m:boolean;
  n1,d1,n2,d2,i,n,d,g:int64;
  s:string;
  op:char;
procedure interpret(var n,d:int64);
  var
    m:boolean;
    i:int64;
    junk:word;
    x,y,z:byte;
  begin
    if s[1]='-' then begin
      m:=true;delete(s,1,1);
    end
    else
      m:=false;
    x:=pos(' ',s);y:=pos('/',s);z:=length(s);
    if x>0 then begin
      val(copy(s,1,x-1),i,junk);
      val(copy(s,x+1,y-x-1),n,junk);
      val(copy(s,y+1,z-y),d,junk);
    end
    else if y>0 then begin
      i:=0;
      val(copy(s,1,y-1),n,junk);
      val(copy(s,y+1,z-y),d,junk);
    end
    else begin
      val(s,i,junk);
      n:=0;d:=1;
    end;
    inc(n,i*d);
    if m then n:=-n;
  end;
function gcd(a,b:int64):int64;
  var
    t:int64;
  begin
    while b<>0 do begin
      t:=a mod b;a:=b;b:=t;
    end;
    gcd:=a;
  end;
begin
  readln(s);interpret(n1,d1);
  readln(op);
  readln(s);interpret(n2,d2);
  case op of
    '+':begin n:=n1*d2+n2*d1;d:=d1*d2;end;
    '-':begin n:=n1*d2-n2*d1;d:=d1*d2;end;
    '*':begin n:=n1*n2;d:=d1*d2;end;
    '/':begin n:=n1*d2;d:=d1*n2;end;
  end;
  if n=0 then m:=false else m:=(n<0) xor (d<0);n:=abs(n);d:=abs(d);
  i:=n div d;n:=n mod d;
  g:=gcd(d,n);n:=n div g;d:=d div g;
  if m then write('-');
  if (i<>0) or (n=0) then write(i);
  if (i<>0) and (n<>0) then write(' ');
  if (n<>0) then write(n,'/',d);
  writeln;
end.

end.
