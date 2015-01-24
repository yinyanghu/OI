//Written on 6439 -- Dec 12, 2005
program partpali;
const
  maxm=999;
  maxs=19;
var
  rem:array[1..maxs]of word;
  count:array[boolean,0..maxm-1]of cardinal;
  t,u,m,s,i,j,k,x:longint;
  ans:cardinal;
  b1,b2:boolean;
begin
  read(t);
  for u:=1 to t do begin
    read(m,s);
    if m mod 10=0 then begin writeln(0);continue;end;

    rem[1]:=1;for i:=2 to s do rem[i]:=rem[i-1]*10 mod m;
    for i:=1 to s shr 1 do inc(rem[i],rem[s+1-i]);
    s:=(s+1) shr 1;

    b1:=false;fillchar(count[b1],sizeof(count[b1]),0);count[b1,0]:=1;
    for i:=1 to s-1 do begin
      b2:=b1;b1:=not b2;
      fillchar(count[b1],sizeof(count[b1]),0);
      for j:=ord(i=1) to 9 do begin
        x:=-j*rem[i] mod m;if x<0 then inc(x,m);
        for k:=0 to m-1 do begin
          inc(count[b1,k],count[b2,x]);
          x:=(x+1) mod m;
        end;
      end;
    end;

    ans:=0;
    for j:=ord(s=1) to 9 do begin
      x:=-j*rem[s] mod m;if x<0 then inc(x,m);
      inc(ans,count[b1,x]);
    end;
    writeln(ans);
  end;
end.
