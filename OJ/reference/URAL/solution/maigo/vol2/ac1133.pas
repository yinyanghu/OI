program ural1133;
const
  pp=(1+sqrt(5))/2;
  pm=(1-sqrt(5))/2;
  mp=(-1+sqrt(5))/2;
  mm=(-1-sqrt(5))/2;
var
  i,j,n:integer;
  fi,fj,f1,f2,fn:longint;
  a1,b1,a2,b2:extended;
function pow(b:extended;e:integer):extended;
  var
    i:integer;
    p:extended;
  begin
    p:=1;
    if e<0 then begin
      b:=1/b;e:=-e;
    end;
    for i:=1 to e do
      p:=p*b;
    pow:=p;
  end;
function coef1(x:integer):extended;
  begin
    coef1:=(mp*pow(pp,x-1)-mm*pow(pm,x-1))/sqrt(5);
  end;
function coef2(x:integer):extended;
  begin
    coef2:=(pow(pp,x-1)-pow(pm,x-1))/sqrt(5);
  end;
begin
  read(i,fi,j,fj,n);
  a1:=coef1(i);b1:=coef2(i);a2:=coef1(j);b2:=coef2(j);
  f1:=round((fi*b2-fj*b1)/(a1*b2-a2*b1));
  f2:=round((fi*a2-fj*a1)/(b1*a2-b2*a1));
  fn:=round(coef1(n)*f1+coef2(n)*f2);
  writeln(fn);
end.
