program ural1310;
const
  maxl=100;
  maxk=50;
  big=10000000;
type
  bignum=array[-1..25]of longint;
var
  count:array[1..maxl-1,0..maxk-1]of bignum;
  l,m,k,i,j,p,r:byte;
  s:string;
  code,t:bignum;
procedure str2big(s:string;var b:bignum);
  var
    l,i:byte;
    junk:word;
  begin
    b[-1]:=0;
    while length(s)>7 do begin
      val(copy(s,length(s)-6,7),b[b[-1]],junk);
      delete(s,length(s)-6,7);
      inc(b[-1]);
    end;
    val(s,b[b[-1]],junk);
  end;
function BiggerOrEqual(a,b:bignum):boolean;
  var
    i:byte;
  begin
    if a[-1]>b[-1] then begin
      BiggerOrEqual:=true;exit;
    end;
    if a[-1]<b[-1] then begin
      BiggerOrEqual:=false;exit;
    end;
    for i:=a[-1] downto 0 do begin
      if a[i]>b[i] then begin
        BiggerOrEqual:=true;exit;
      end;
      if a[i]<b[i] then begin
        BiggerOrEqual:=false;exit;
      end;
    end;
    BiggerOrEqual:=true;
  end;
procedure add(var a,b:bignum);
  var
    i:byte;
  begin
    if b[-1]>a[-1] then a[-1]:=b[-1];
    for i:=0 to a[-1] do begin
      inc(a[i],b[i]);
      if a[i]>=big then begin
        dec(a[i],big);inc(a[i+1]);
      end;
    end;
    if a[a[-1]+1]>0 then inc(a[-1]);
  end;
procedure sub(var a,b:bignum);
  var
    i:byte;
  begin
    for i:=0 to a[-1] do begin
      dec(a[i],b[i]);
      if a[i]<0 then begin
        inc(a[i],big);dec(a[i+1]);
      end;
    end;
    while (a[-1]>0) and (a[a[-1]]=0) do dec(a[-1]);
  end;
procedure mul(var a:bignum;b:byte);
  var
    i:byte;
  begin
    for i:=0 to a[-1] do
      a[i]:=a[i]*b;
    for i:=0 to a[-1] do
      if a[i]>big then begin
        inc(a[i+1],a[i] div big);
        a[i]:=a[i] mod big;
      end;
    while a[a[-1]+1]>0 do begin
      inc(a[-1]);
      a[a[-1]+1]:=a[a[-1]] div big;
      a[a[-1]]:=a[a[-1]] mod big;
    end;
  end;
begin
  readln(l,m,k);
  readln(s);
  str2big(s,code);

  count[1,0][0]:=m div k;
  for i:=1 to k-1 do
    count[1,i][0]:=m div k+ord(i<=m mod k);
  for i:=2 to l-1 do
    for j:=0 to k-1 do begin
      fillchar(t,sizeof(t),0);
      for p:=0 to k-1 do begin
        r:=(j+k-p) mod k;
        if count[1,p][0]=count[1,0][0] then
          add(count[i,j],count[i-1,r])
        else
          add(t,count[i-1,r]);
      end;
      mul(count[i,j],count[1,0][0]);
      mul(t,count[1,0][0]+1);
      add(count[i,j],t);
    end;

  p:=1;i:=1;r:=k-1;
  while p<l do begin
    if BiggerOrEqual(code,count[l-p,r]) then begin
      sub(code,count[l-p,r]);
      inc(i);
    end
    else begin
      write(i,' ');
      inc(p);i:=1;
    end;
    if r=0 then r:=k-1 else dec(r);
  end;
  writeln(i+r+k*code[0]);
end.
