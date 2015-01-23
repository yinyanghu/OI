program question23;
var a:string;
    b:boolean;
    e:array[1..3] of boolean;
    l,i,total:longint;
    c:char;
begin
    readln(a);
    l:=length(a);
    total:=0; b:=true;
    fillchar(e,sizeof(e),false);
    for i:=1 to l do begin
        c:=a[i];
        if c in ['a'..'z',' ',','] then begin
            if c in ['a'..'z'] then
              if (i=1) or ((a[i-1]='') or (a[i-1]=',')) then inc(total);
        end else begin
            b:=false;
            case c of
                'A'..'Z':e[1]:=true;
                '0'..'9':e[2]:=true;
                else e[3]:=true;
            end;
        end;
    end;
    if b then writeln(total)
      else begin
          write('error');
          for i:=1 to 3 do if e[i] then write(i:3);
      end;
      readln;
end.
