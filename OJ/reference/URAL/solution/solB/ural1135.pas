var
        turn,right      :       longint;
        i,n             :       longint;
        ch              :       char;

begin
  read(n);
  for i:=1 to n do
    begin
      repeat
        read(ch);
      until (ch='<') or (ch='>');
      if ch='>' then inc(right)
                else inc(turn,right);
    end;
  writeln(turn);
end.