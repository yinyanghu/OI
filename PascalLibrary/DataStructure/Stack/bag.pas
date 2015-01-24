program bag;
var n,maxw:longint;
    i,j,k:integer;
    w:array[1..1000] of longint;
    stack:array[1..1000] of integer;

function knap:boolean;
 var top,i:longint;
 begin
     top:=0; i:=1;
     while (maxw>0) and (i<=n) do begin
         if (maxw-w[i]>=0) and (i<=n) then begin
             top:=top+1;
             stack[top]:=i;
             maxw:=maxw-w[i];
         end;
         if maxw=0 then exit(true);
         if (i=n) and (top>0) then begin
             i:=stack[top];
             top:=top-1;
             maxw:=maxw+w[i];
             if top>0 then begin
                 i:=stack[top];
                 top:=top-1;
                 maxw:=maxw+w[i];
             end;
         end;
         i:=i+1;
     end;
     exit(false);
 end;

begin
    readln(n,maxw);
    for i:=1 to n do read(w[i]);
    if knap then begin
        for i:=1 to n do if stack[i]<>0 then writeln('No.',stack[i]);
        halt;
    end;
    writeln('No answer!');
end.