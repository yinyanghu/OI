program triangle;
var a,b,c,d,e,f:1..6;
    k:longint;
    p:array[1..1000] of integer;

function ok:boolean;
 var m,i:integer;
 begin
     m:=a+c+e;
     for i:=1 to 1000 do
       if p[i]=m then exit(true);
     p[k]:=m;
     inc(k);
     ok:=false;
 end;

begin
    fillchar(p,sizeof(p),0);
    k:=1;
    for a:=1 to 6 do
      for b:=1 to 6 do
        for c:=1 to 6 do
          for d:=1 to 6 do
            for e:=1 to 6 do
               for f:=1 to 6 do
                  if (a+b+c+d+e+f=21) and (a*b*c*d*e*f=720) and (a+b+c=c+d+e)
                    and (a+b+c=a+e+f) and (c+d+e=a+e+f) and (not ok) then
                        writeln(a:2,b:2,c:2,d:2,e:2,f:2);
end.