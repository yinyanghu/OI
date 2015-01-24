var
        ans             :       array[0..10000] of longint;
        n               :       longint;

procedure multi(x:longint);
var
        i,k     :       longint;
begin
  k:=0;
  for i:=1 to ans[0] do
    begin
      ans[i]:=ans[i]*x+k;
      k:=ans[i] div 10;
      ans[i]:=ans[i] mod 10;
    end;
  ans[ans[0]+1]:=k;
  while ans[ans[0]+1]<>0 do inc(ans[0]);
end;

var
        i       :       longint;
begin
  readln(n);
  fillchar(ans,sizeof(ans),0);
  ans[1]:=1;
  ans[0]:=1;
  if n<5 then
    begin
      writeln(n);
      halt;
    end;
  for i:=1 to n div 3-1 do multi(3);
  case n mod 3 of
    0 : multi(3);
    1 : multi(4);
    2 : multi(6);
  end;
  for i:=ans[0] downto 1 do write(ans[i]);
  writeln;
end.