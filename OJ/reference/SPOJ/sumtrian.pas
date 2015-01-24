//Written on 6123 -- Jan 30, 2005
program sumtrian;
const
  maxn=99;
var
  s:array[boolean,0..maxn]of word;
  t,u,n,i,j:word;
begin
  read(t);
  for u:=1 to t do begin
    fillchar(s,sizeof(s),0);
    read(n);
    for i:=1 to n do
      for j:=1 to i do begin
        read(s[odd(i),j]);
        if s[not odd(i),j-1]>s[not odd(i),j] then
          inc(s[odd(i),j],s[not odd(i),j-1])
        else
          inc(s[odd(i),j],s[not odd(i),j]);
      end;
    j:=0;
    for i:=1 to n do
      if s[odd(n),i]>j then j:=s[odd(n),i];
    writeln(j);
  end;
end.
