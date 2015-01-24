program ural1305;
var
  n,x,y,i,minheng,maxheng,minshu,maxshu,minpie,maxpie,minna,maxna:longint;
begin
  minheng:=maxlongint;maxheng:=-maxlongint;
  minshu:=maxlongint;maxshu:=-maxlongint;
  minpie:=maxlongint;maxpie:=-maxlongint;
  minna:=maxlongint;maxna:=-maxlongint;

  read(n);
  if n=1 then begin
    read(x,y);
    writeln(x,' ',y);
  end;

  for i:=1 to n do begin
    read(x,y);
    if y<minheng then minheng:=y;if y>maxheng then maxheng:=y;
    if x<minshu then minshu:=x;if x>maxshu then maxshu:=x;
    if x-y<minpie then minpie:=x-y;if x-y>maxpie then maxpie:=x-y;
    if x+y<minna then minna:=x+y;if x+y>maxna then maxna:=x+y;
  end;

  if minna-maxpie<minheng*2 then writeln(minna-minheng,' ',minheng);
  if maxshu-minheng>maxpie then writeln(maxpie+minheng,' ',minheng);
  if maxpie+maxna>maxshu*2 then writeln(maxshu,' ',maxshu-maxpie);
  if maxshu+maxheng>maxna then writeln(maxshu,' ',maxna-maxshu);
  if maxna-minpie>maxheng*2 then writeln(maxna-maxheng,' ',maxheng);
  if minshu-maxheng<minpie then writeln(minpie+maxheng,' ',maxheng);
  if minpie+minna<minshu*2 then writeln(minshu,' ',minshu-minpie);
  if minshu+minheng<minna then writeln(minshu,' ',minna-minshu);
end.
