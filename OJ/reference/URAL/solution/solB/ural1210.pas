var
        f1,f2             :       array[1..30] of longint;
        n,i,j,k,x,y,ans   :       longint;
        ch                :       char;
begin
//  assign(input,'d.in');reset(input);
  fillchar(f1,sizeof(f1),0);
  readln(n);
  for i:=1 to n do
    begin
      readln(k);
      for j:=1 to 30 do f2[j]:=maxlongint shr 2;
      for j:=1 to k do
        repeat
          read(x);
          if x=0 then break;
          read(y);
          if f1[x]+y<f2[j] then f2[j]:=f1[x]+y;
        until false;
      f1:=f2;
      readln;
      readln(ch);
    end;
  ans:=maxlongint;
  for i:=1 to k do
    if f1[i]<ans then ans:=f1[i];
  writeln(ans);
end.