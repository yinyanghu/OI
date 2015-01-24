program ural1030;
const
  r=6875/2;
var
  s:string;
  longi,lati,ax,ay,az,bx,by,bz,d,si,co,angle,arc:real;
procedure recog(s:string;var angle:real);
  function value(p,q:byte):byte;
    var
      junk:word;
    begin
      val(copy(s,p,q-p+1),value,junk);
    end;
  begin
    angle:=value(1,pos('^',s)-1);
    delete(s,1,pos('^',s));
    angle:=angle+value(1,pos('''',s)-1)/60;
    delete(s,1,pos('''',s));
    angle:=angle+value(1,pos('"',s)-1)/3600;
    delete(s,1,pos('"',s));
    angle:=angle*pi/180;
    if (s[2]='S') or (s[2]='W') then angle:=-angle;
  end;
begin
  readln;readln;readln;
  readln(s);recog(s,lati);readln(s);delete(s,1,4);recog(s,longi);
  ax:=r*cos(lati)*cos(longi);ay:=r*cos(lati)*sin(longi);az:=r*sin(lati);
  readln;
  readln(s);recog(s,lati);readln(s);delete(s,1,4);recog(s,longi);
  bx:=r*cos(lati)*cos(longi);by:=r*cos(lati)*sin(longi);bz:=r*sin(lati);

  d:=sqrt(sqr(ax-bx)+sqr(ay-by)+sqr(az-bz));
  si:=d/2/r;
  if si=1 then
    angle:=pi/2
  else begin
    co:=sqrt(1-sqr(si));
    angle:=arctan(si/co);
  end;
  arc:=r*angle*2;

  writeln('The distance to the iceberg: ',arc:0:2,' miles.');
  if arc<99.995 then writeln('DANGER!');
end.
