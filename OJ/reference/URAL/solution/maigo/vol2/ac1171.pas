program ural1171;
const
  maxn=16;
  dir:array[0..3]of char=('E','S','W','N');
  oppodir:array[0..3]of char=('W','N','E','S');
var
  food,door:array[1..maxn,1..4,1..4]of byte;
  dp:array[0..16{level},0..16*maxn{day},1..4,1..4]of word;
  len:array[1..16,1..16*maxn,1..4,1..4]of byte;
  path:array[1..16,1..16*maxn,1..4,1..4]of longint;
  v:array[1..4,1..4]of boolean;
  best:array[1..16,1..4,1..4]of word;
  bpath:array[1..16,1..4,1..4]of longint;
  n,x,y,l,i,j,got,d:word;
  way:longint;
  ratio:real;
  s:string;
procedure updatebest(day:word;a,b:byte);
  begin
    if got>best[day,a,b] then begin
      best[day,a,b]:=got;
      bpath[day,a,b]:=way;
    end;
  end;
procedure search(day:word;a,b,d:byte);
  begin
    inc(got,food[l,a,b]);way:=way shl 2+d;v[a,b]:=true;
    updatebest(day,a,b);
    if (b<4) and not v[a,b+1] then search(day+1,a,b+1,0);
    if (a<4) and not v[a+1,b] then search(day+1,a+1,b,1);
    if (b>1) and not v[a,b-1] then search(day+1,a,b-1,2);
    if (a>1) and not v[a-1,b] then search(day+1,a-1,b,3);
    dec(got,food[l,a,b]);way:=way shr 2;v[a,b]:=false;
  end;
procedure update;
  var
    a,b,d,day:word;
  begin
    for a:=1 to 4 do
      for b:=1 to 4 do
        for d:=1 to 16 do
          for day:=l to 16*l do
            if (day>=d) and ((l=1) or (dp[l-1,day-d,i,j]>0))
               and (best[d,a,b]>0){This took me 6 days to debug!!!}
               and (dp[l-1,day-d,i,j]+best[d,a,b]>dp[l,day,a,b]) then begin
              dp[l,day,a,b]:=dp[l-1,day-d,i,j]+best[d,a,b];
              len[l,day,a,b]:=d-1;
              path[l,day,a,b]:=bpath[d,a,b];
            end;
  end;
procedure track(l:byte);
  var
    i:byte;
    s:string;
  procedure extract(l:byte;p:longint;var s:string);
    var
      i:byte;
    begin
      s:='';
      for i:=1 to l do begin
        s:=s+oppodir[p mod 4];
        p:=p shr 2;
      end;
    end;
  begin
    extract(len[l,d,x,y],path[l,d,x,y],s);
    write(s);
    if l>1 then begin
      for i:=1 to length(s) do
        case s[i] of 'E':inc(y);'S':inc(x);'W':dec(y);'N':dec(x);end;
      write('D');
      dec(d,length(s)+1);
    end
    else
      writeln;
  end;
begin
  read(n);
  for l:=n downto 1 do begin
    for i:=1 to 4 do
      for j:=1 to 4 do
        read(food[l,i,j]);
    for i:=1 to 4 do
      for j:=1 to 4 do
        read(door[l,i,j]);
  end;
  read(x,y);
  for i:=1 to 4 do
    for j:=1 to 4 do
      door[1,i,j]:=1;

  for l:=1 to n do
    for i:=1 to 4 do
      for j:=1 to 4 do
        if door[l,i,j]=1 then begin
          fillchar(best,sizeof(best),0);
          got:=0;way:=0;
          search(1,i,j,0);
          update;
        end;

  for i:=n to 16*n do
    if dp[n,i,x,y]/i>ratio then begin
      ratio:=dp[n,i,x,y]/i;
      d:=i;
    end;

  writeln(ratio:0:4);
  writeln(d-1);
  for i:=n downto 1 do
    track(i);
end.
