  {$I+,Q+,R+,S-}
program sdk;
  const s:array[1..8,1..3]of integer=((0,0,0),(0,0,1),(0,1,0),(1,0,0),(0,1,1),
                                      (1,0,1),(1,1,0),(1,1,1));
        ss:array[1..8]of string[3]=('SSS','SSB','SBS','BSS','SBB','BSB','BBS','BBB');
        name:array[1..3]of char=('P','O','S');
  var i,j,k,h,l,x,y,z,m,n:longint;
      a,b:array[1..13,1..13]of longint;
      sign:array[1..100000]of integer;
      use:array[1..13]of boolean;
      d:array[1..100,1..3]of longint;
      p:boolean;
      cr:string[3];
procedure pr(k,t:longint);
  var fa,now:integer;
  begin
    if d[k,3]<>0 then
      begin
        pr(d[k,3],t);
        now:=d[k,1];
        fa:=d[d[k,3],1];
        if a[fa,now]-b[fa,now]>0 then inc(b[fa,now],t)
        else dec(b[now,fa],t);
      end;
  end;
  begin
{    assign(input,'input.txt');
    reset(input);}
    read(x,y,z);
    a[10,13]:=x div 2;
    a[11,13]:=y div 2;
    a[12,13]:=z div 2;
    read(n);
    readln;
    for i:=1 to n do
      begin
        readln(cr);
        for j:=1 to 8 do
          if cr=ss[j] then
            begin
              for k:=1 to 3 do
                inc(a[j+1,9+k],s[j,k]);
              inc(a[1,j+1],1);
              sign[i]:=j;
              break;
            end;
      end;
    repeat
      p:=false;
      d[1,1]:=1;
      d[1,2]:=maxlongint;
      fillchar(use,sizeof(use),#1);
      use[1]:=false;
      h:=0;
      l:=1;
      repeat
        inc(h);
        for i:=1 to 13 do
          if (use[i])and(a[d[h,1],i]-b[d[h,1],i]>0) then
            begin
              use[i]:=false;
              inc(l);
              d[l,1]:=i;
              d[l,2]:=a[d[h,1],i]-b[d[h,1],i];
              if d[h,2]<d[l,2] then d[l,2]:=d[h,2];
              d[l,3]:=h;
            end
          else if (use[i])and(b[i,d[h,1]]>0) then
            begin
              use[i]:=false;
              inc(l);
              d[l,1]:=i;
              d[l,2]:=b[i,d[h,1]];
              if d[h,2]<d[l,2] then d[l,2]:=d[h,2];
              d[l,3]:=h;
            end;
      until (h=l)or(d[h,1]=13);
      if d[h,1]=13 then
        begin
          p:=true;
          pr(h,d[h,2]);
        end;
    until not p;
    x:=x-b[10,13]*2;
    y:=y-b[11,13]*2;
    z:=z-b[12,13]*2;
    
    if b[10,13]+b[11,13]+b[12,13]+x+y+z>n then
      begin
        writeln('no solution');
        exit;
      end;
      writeln(x,' ',y,' ',z);
    for i:=1 to n do
      if b[1,sign[i]+1]>0 then
        begin
          dec(b[1,sign[i]+1]);
          for j:=10 to 12 do
            if b[sign[i]+1,j]>0 then
              begin
                write(name[j-9]);
                dec(b[sign[i]+1,j]);
                break;
              end;
        end
      else
        begin
          if x>0 then
            begin
              dec(x);
              write(name[1]);
            end
          else if y>0 then
            begin
              dec(y);
              write(name[2]);
            end
          else
            begin
              dec(z);
              write(name[3]);
            end;
        end;
    writeln;
  end.