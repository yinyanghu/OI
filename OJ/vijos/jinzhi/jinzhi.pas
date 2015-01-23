program jinzhi;
var a:array[0..1000] of integer;
    n,m,i,j,k,p:longint;
function ok(k:integer):char;
 begin
     if k in [0..9] then ok:=chr(k+48) else
          case k of
              10:ok:='A';
              11:ok:='B';
              12:ok:='C';
              13:ok:='D';
              14:ok:='E';
              15:ok:='F';
              16:ok:='G';
              17:ok:='H';
              18:ok:='I';
              19:ok:='J';
              20:ok:='K';
          end;
 end;
begin
    assign(input,'jinzhi5.in'); reset(input);
    assign(output,'jinzhi.out'); rewrite(output);
    while not eof do begin
        readln(n,m);
        fillchar(a,sizeof(a),0);
        p:=n; k:=0;
        while (p<0) or (p>=abs(m)) do begin
            a[k]:=p mod m;
            p:=p div m;
            if a[k]<0 then begin
                a[k]:=a[k]-m;
                inc(p);
            end;
            inc(k);
        end;
        a[k]:=p;
        write(n,'=');
        for i:=k downto 0 do write(ok(a[i]));
        write('(base ',m,')');
        writeln;
    end;
    close(input);
    close(output);
end.
