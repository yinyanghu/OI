var
        map     :       array[1..100,1..100] of boolean;
        indgr   :       array[1..100       ] of longint;
        i,j,k,n :       longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      repeat
        read(j);
        if j=0 then break;
        map[i,j]:=true;
        inc(indgr[j]);
      until false;
      readln;
    end;
  for i:=1 to n do
    begin
      for j:=1 to n do
        if indgr[j]=0 then break;
      if i<>n then write(j,' ') else writeln(j);
      for k:=1 to n do if map[j,k] then dec(indgr[k]);
      indgr[j]:=-1;
    end;
end.