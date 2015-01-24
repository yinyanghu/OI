const
        c       :       set of char = ['A'..'Z','a'..'z'];
var
        ans,s   :       string;
        i,j     :       longint;
        ch      :       char;

begin
  repeat
    read(ch);
    if ch in c then
      begin
        s:=ch+s;
      end
    else
      begin
        write(s,ch);
        s:='';
      end;
  until eof;
  write(s);
end.