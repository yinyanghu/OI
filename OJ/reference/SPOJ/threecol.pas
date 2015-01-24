//Written on 6177 -- Mar 25, 2005
program threecol;
var
  t,u,ymax,ymin,nmax,nmin:word;
function max(a,b:word):word;
  begin
    if a>b then max:=a else max:=b;
  end;
function min(a,b:word):word;
  begin
    if a<b then min:=a else min:=b;
  end;
procedure node(var ymax,ymin,nmax,nmin:word);
  var
    c:char;
    ymax1,ymin1,nmax1,nmin1,ymax2,ymin2,nmax2,nmin2:word;
  begin
    read(c);
    case c of
      '0':begin ymax:=1;ymin:=1;nmax:=0;nmin:=0;end;
      '1':begin
            node(ymax1,ymin1,nmax1,nmin1);
            ymax:=nmax1+1;ymin:=nmin1+1;
            nmax:=max(ymax1,nmax1);nmin:=min(ymin1,nmin1);
          end;
      '2':begin
            node(ymax1,ymin1,nmax1,nmin1);
            node(ymax2,ymin2,nmax2,nmin2);
            ymax:=nmax1+nmax2+1;ymin:=nmin1+nmin2+1;
            nmax:=max(ymax1+nmax2,nmax1+ymax2);
            nmin:=min(ymin1+nmin2,nmin1+ymin2);
          end;
    end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    readln;
    node(ymax,ymin,nmax,nmin);
    writeln(max(ymax,nmax),' ',min(ymin,nmin));
  end;
end.
