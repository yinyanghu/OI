const
        o : array[0..6] of longint = (3241,2134,1342,1243,2341,1234,1324);

var
        s            :       string;
        ans          :       qword;
        i,j,n        :       longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      ans:=0;
      delete(s,pos('1',s),1);
      delete(s,pos('2',s),1);
      delete(s,pos('3',s),1);
      delete(s,pos('4',s),1);
      for j:=1 to length(s) do
        begin
          ans:=ans*10+ord(s[j])-48;
        end;
      ans:=((ans mod 7)*10000) mod 7;
      writeln(s,o[ans]);
    end;
end.
