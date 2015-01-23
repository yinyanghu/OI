program p1344;
var v:char;
    a,b,c,d,p:longint;
    s:string;
    ans:double;

procedure analyse(s:string; var x,y:longint);
 var p,f,m:longint;
 begin
     x:=0; y:=0; p:=1;
     repeat
        f:=1; m:=0;
        case s[p] of
            '-': begin f:=-1; inc(p); end;
            '+': begin f:=1; inc(p); end;
        end;
        if s[p]=v then m:=1;
        while (p<=length(s)) and (s[p] in ['0'..'9']) do begin
            m:=m*10+ord(s[p])-ord('0');
            inc(p);
        end;
        if (p<=length(s))and(s[p]=v) then begin
           x:=x+m*f;
           inc(p);
        end else y:=y+m*f;
     until p>length(s);
 end;

begin
    readln(s);
    p:=pos('=',s);
    for v:='a' to 'z' do
       if pos(v,s)>0 then break;
    analyse(copy(s,1,p-1),a,b);
    analyse(copy(s,p+1,length(s)-p),c,d);
    ans:=(d-b)/(a-c);
    if abs(ans)<0.001 then ans:=0;
    writeln(v,'=',ans:0:3);
end.