program numbercheng;
var n:integer;
    total:extended;
    s:array[0..255] of word;

procedure print(k:integer);
 var i:integer;
 begin
     for i:=1 to k do write(s[i]:5);
     writeln;
     total:=total+1;
 end;

procedure try(n,k:longint);
 var i,rest:integer;
 begin
     for i:=2 to n do
       if (s[k-1]<=i) and (n mod i=0) then begin
           s[k]:=i;
           rest:=n div i;
           if (rest>1) then try(rest,k+1)
              else if (rest=1) then print(k);
           s[k]:=0;
       end;
 end;

begin
    readln(n);
    fillchar(s,sizeof(s),0);
    total:=0; s[0]:=0;
    try(n,1);
    writeln('Total=',total:0:0);
end.