program funcfunc;
var a,b,c,total:longint;
    ok:array[-100..200,-100..200,-100..200] of boolean;
    s:array[-100..200,-100..200,-100..200] of longint;

function f(a,b,c:longint):longint;
 begin
     if ok[a,b,c] then exit(s[a,b,c]);
     if (a<=0) or (b<=0) or (c<=0) then f:=1
       else if (a>20) or (b>20) or (c>20) then f:=f(20,20,20)
         else if (a<b) and (b<c) then begin
            f:=f(a,b,c-1)+f(a,b-1,c-1)-f(a,b-1,c);
            ok[a,b,c]:=true;
            s[a,b,c]:=f;
         end else begin
             f:=f(a-1,b,c)+f(a-1,b-1,c)+f(a-1,b,c-1)-f(a-1,b-1,c-1);
             ok[a,b,c]:=true;
             s[a,b,c]:=f;
         end;
 end;
begin
    readln(a,b,c);
    repeat
        {if (a>20) or (b>20) or (c>20) then total:=f(20,20,20)
          else if (a<=0) or (b<=0) or (c<=0) then total:=1
            else total:=f(a,b,c);}
        total:=f(a,b,c);
        writeln('w(',a,', ',b,', ',c,') = ',total);
        readln(a,b,c);
    until (a=-1) and (b=-1) and (c=-1);
end.
