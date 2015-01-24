//Written on 6295 -- Jul 21, 2005
program sleep;
const
  maxk=60;
  step:array[0..2,0..2]of byte=((0,7,8),(1,6,5),(2,3,4));
type
  Tten=array[-1..58]of shortint;
  Tnot_ten=array[1..maxk]of shortint;
var
  ten:Tten;
  xa,ya,sa,xb,yb,sb:Tnot_ten;
  n,u,k,i,j,t:longint;
procedure read_ten;
  var
    c:char;
    s:string;
  begin
    s:='';repeat read(c);if c=' ' then break;s:=s+c;until eoln;
    j:=length(s);ten[-1]:=j-1;
    for i:=0 to ten[-1] do ten[i]:=ord(s[j-i])-48;
    dec(ten[0]);i:=0;while ten[i]<0 do begin inc(ten[i],10);inc(i);dec(ten[i]);end;
    while (ten[-1]>0) and (ten[ten[-1]]=0) do dec(ten[-1]);
  end;
procedure ten_three(var three:Tnot_ten);
  begin
    for i:=1 to k do begin
      for j:=ten[-1] downto 1 do begin
        inc(ten[j-1],(ten[j] mod 3)*10);
        ten[j]:=ten[j] div 3;
      end;
      three[i]:=ten[0] mod 3;
      ten[0]:=ten[0] div 3;
      while (ten[-1]>0) and (ten[ten[-1]]=0) do dec(ten[-1]);
    end;
  end;
procedure cal_step(var x,y,s:Tnot_ten);
  begin
    for i:=k downto 1 do begin
      s[i]:=step[x[i],y[i]];
      case s[i] of
        0,1:for j:=1 to i-1 do begin t:=x[j];x[j]:=y[j];y[j]:=t;end;
        6,7:for j:=1 to i-1 do begin t:=2-x[j];x[j]:=2-y[j];y[j]:=t;end;
        5:for j:=1 to i-1 do begin x[j]:=2-x[j];y[j]:=2-y[j];end;
      end;
    end;
  end;
procedure sub_nine(var a,b:Tnot_ten);
  begin
    for i:=1 to k do begin
      if a[i]<b[i] then begin inc(a[i],9);dec(a[i+1]);end;
      dec(a[i],b[i]);
    end;
  end;
procedure nine_ten(var nine:Tnot_ten);
  begin
    fillchar(ten,sizeof(ten),0);
    for i:=k downto 1 do begin
      for j:=0 to ten[-1] do ten[j]:=ten[j]*9;
      ten[0]:=ten[0]+nine[i];
      for j:=0 to ten[-1] do begin inc(ten[j+1],ten[j] div 10);ten[j]:=ten[j] mod 10;end;
      while ten[ten[-1]+1]>0 do inc(ten[-1]);
    end;
  end;
procedure out_ten;
  begin
    for i:=ten[-1] downto 0 do write(ten[i]);writeln;
  end;
begin
  read(n);
  for u:=1 to n do begin
    readln(k);
    read_ten;ten_three(xa);
    read_ten;ten_three(ya);readln;
    read_ten;ten_three(xb);
    read_ten;ten_three(yb);readln;
    cal_step(xa,ya,sa);cal_step(xb,yb,sb);
    sub_nine(sb,sa);
    nine_ten(sb);
    out_ten;
  end;
end.
