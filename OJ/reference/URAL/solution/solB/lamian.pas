const
                maxlongint = 2139062143;

var
                f1,f2      :       array[-12000..12000] of longint;
                a,b        :       array[1..1000] of longint;
                ans,n,max  :       longint;
                i,j,k      :       longint;

procedure prepare;
begin
  assign(input,'l.in');reset(input);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i],b[i]);
      inc(max,abs(a[i]-b[i]));
    end;
  close(input);
  fillchar(f1,sizeof(f1),127);
  f1[0]:=0;
end;

procedure work;
begin
  for i:=1 to n do
    begin
      fillchar(f2,sizeof(f2),127);
      for j:=0 to max do
        begin
          f2[j]:=f1[j-a[i]+b[i]];
          if f1[j-b[i]+a[i]]+1<f2[j] then
            f2[j]:=f1[j-b[i]+a[i]]+1;
        end;
      f1:=f2;
      end;
end;

procedure print;
begin
  ans:=maxlongint;
  for i:=0 to max do
    if (f2[i]<>maxlongint) or (f2[-i]<>maxlongint) then
      begin
        ans:=f2[i];
        if ans>f2[-i] then ans:=f2[-i];
        break;
      end;
  writeln(ans);
end;

begin
  prepare;
  work;
  print;
end.