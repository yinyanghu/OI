program heart;
const f:array[1..13] of integer=(-50,-2,-3,-4,-5,-6,-7,-8,-9,-10,-20,-30,-40);
var s:array[1..4] of longint;
    m:array[1..4] of integer;
    sheep,pig,fan,quit:boolean;
    i,j,k,n,size:longint;
    c:char;
begin
    assign(input,'heart.in'); reset(input);
    assign(output,'heart.out'); rewrite(output);
    while not eof do begin
        fillchar(s,sizeof(s),0);
        fillchar(m,sizeof(m),0);
        for i:=1 to 4 do begin
            sheep:=false;
            pig:=false;
            fan:=false;
            read(m[i]);
            for j:=1 to m[i] do begin
                repeat
                    read(c);
                until c>='A';
                read(size);
                case c of
                    'S':pig:=true;
                    'H':s[i]:=s[i]+f[size];
                    'D':sheep:=true;
                    'C':fan:=true;
                end;
            end;
            if (s[i]=-194) and (pig) and (sheep) then s[i]:=500
              else if (s[i]=-194) then begin
                 s[i]:=200;
                 if pig then s[i]:=s[i]-100;
                 if sheep then s[i]:=s[i]+100;
              end else if (s[i]<>-194) then begin
                  if pig then s[i]:=s[i]-100;
                  if sheep then s[i]:=s[i]+100;
              end;
            if fan and (m[i]=1) then s[i]:=s[i]+50
               else if fan then s[i]:=s[i]*2;
        end;
        quit:=true;
        for i:=1 to 4 do if m[i]<>0 then quit:=false;
        if quit then begin
            close(input);
            close(output);
            halt;
        end;
        for i:=1 to 3 do begin
            if s[i]>0 then write('+',s[i],' ') else write(s[i],' ');
        end;
        write(s[4]);
        writeln;
    end;
    close(input);
    close(output);
end.
