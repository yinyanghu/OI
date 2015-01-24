program ural1221;
const
  maxn=100;
var
  map,s1,s2,s3,s4:array[1..maxn,1..maxn]of byte;
  n,i,j,ans:byte;
begin
  repeat
    read(n);
    if n=0 then halt;
    for i:=1 to n do
      for j:=1 to n do
        read(map[i,j]);

    for i:=1 to n do
      for j:=1 to n do
        if map[i,j]=1 then
          s1[i,j]:=0
        else begin
          s1[i,j]:=1;
          if (i>1) and (j>1)
                   and (s1[i-1,j]=s1[i,j-1])
                   and (map[i-s1[i-1,j],j-s1[i-1,j]]=1) then
            s1[i,j]:=s1[i-1,j]+1;
        end;

    for i:=1 to n do
      for j:=n downto 1 do
        if map[i,j]=1 then
          s2[i,j]:=0
        else begin
          s2[i,j]:=1;
          if (i>1) and (j<n)
                   and (s2[i-1,j]=s2[i,j+1])
                   and (map[i-s2[i-1,j],j+s2[i-1,j]]=1) then
            s2[i,j]:=s2[i-1,j]+1;
        end;

    for i:=n downto 1 do
      for j:=1 to n do
        if map[i,j]=1 then
          s3[i,j]:=0
        else begin
          s3[i,j]:=1;
          if (i<n) and (j>1)
                   and (s3[i+1,j]=s3[i,j-1])
                   and (map[i+s3[i+1,j],j-s3[i+1,j]]=1) then
            s3[i,j]:=s3[i+1,j]+1;
        end;

    for i:=n downto 1 do
      for j:=n downto 1 do
        if map[i,j]=1 then
          s4[i,j]:=0
        else begin
          s4[i,j]:=1;
            if (i<n) and (j<n)
                    and (s4[i+1,j]=s4[i,j+1])
                    and (map[i+s4[i+1,j],j+s4[i+1,j]]=1) then
            s4[i,j]:=s4[i+1,j]+1;
        end;

    ans:=0;
    for i:=1 to n do
      for j:=1 to n do
        if (s1[i,j]=s2[i,j]) and (s2[i,j]=s3[i,j]) and (s3[i,j]=s4[i,j]) then
          if s1[i,j]>ans then ans:=s1[i,j];

    if ans>1 then writeln(ans*2-1) else writeln('No solution');
  until false;
end.
