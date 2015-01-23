program p1298;
var i:longint;
    s,t:string;
begin
    readln(s);
    while s<>'ENDOFINPUT' do begin
        readln(s);
        t:='';
        for i:=1 to length(s) do
          if s[i] in ['A'..'Z'] then t:=t+chr((ord(s[i])+8) mod 26+65)
            else t:=t+s[i];
        writeln(t);
        readln(s);
        readln(s);
    end;
end.