const max=100;

var n:array[0..max] of integer;
    b:array[1..max] of char;
    s,t:string;
    i,p,j:integer;

procedure push;
 begin
     inc(p);
     b[p]:=s[i];
 end;
procedure pop;
 begin
     dec(p);
     case b[p+1] of
         '+':inc(n[p],n[p+1]);
         '-':dec(n[p],n[p+1]);
         '*':n[p]:=n[p]*n[p+1];
         '/':n[p]:=n[p] div n[p+1];
     end;
 end;
function can:boolean;
 begin
     can:=true;
     if (s[i] in ['+','-']) and (b[p]<>'(') then exit;
     if (s[i] in ['*','/']) and (b[p] in ['*','/']) then exit;
     can:=false;
 end;
begin
    writeln;
    write('string=');
    readln(s);
    s:='('+s+')';
    i:=1; p:=0;
    while i<=length(s) do begin
        while s[i]='(' do begin
            push;
            inc(i);
        end;
        j:=i;
        repeat
             inc(i);
        until (s[i]<'0') or (s[i]>'9');
        t:=copy(s,j,i-j);
        val(t,n[p]);
        repeat
             if s[i]=')' then begin
                 while b[p]<>'(' do pop;
                 dec(p);
                 n[p]:=n[p+1];
             end else begin
                 while can do pop;
                 push;
             end;
             inc(i);
        until (i>length(s)) or (s[i-1]<>')');
    end;
    writeln('result=',n[0]);
    readln;
end.