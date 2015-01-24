const
        n       =       1999;

var
        s       :       string;
        i,j     :       longint;
        ch      :       char;
begin
//  assign(input,'d.in');reset(input);
  i:=1;
  repeat
    read(ch);
    if ch>=' ' then s:=s+ch;
  until eof;

  while length(s)>1 do
    begin
      inc(i,n-1);
      i:=i mod length(s);
      if i=0 then i:=length(s);
      delete(s,i,1);
    end;
  case s[1] of
    '?'  :  writeln('Yes');
    ' '  :  writeln('No');
    else    writeln('No comments');
  end;
end.
