program ural1219;
const
  len:longint=1000000;
var
  a,b,c,d:char;
begin
  repeat
    for a:='a' to 'z' do
      for b:='a' to 'z' do begin
        for c:='a' to 'z' do begin
          write(a,b,c);
          dec(len,3);
          if len=1 then begin
            writeln('a');
            halt;
          end;
        end;
      end;
  until false;
end.
