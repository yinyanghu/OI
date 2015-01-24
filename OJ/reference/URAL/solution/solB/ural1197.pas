const
        dir     :       array[1..8,1..2] of longint

        =       ((2,1),(1,2),(2,-1),(-1,2),(-2,1),(1,-2),(-1,-2),(-2,-1));

var
        n,i,j,ans,x,y     :       longint;
        ch                :       char;

begin
  readln(n);
  for j:=1 to n do
    begin
      ans:=0;
      readln(ch,y);
      x:=ord(ch)-96;
      for i:=1 to 8 do
        if (x+dir[i,1]<9) and (x+dir[i,1]>0)
          and (y+dir[i,2]<9) and (y+dir[i,2]>0) then
            inc(ans);
      writeln(ans);
    end;
end.