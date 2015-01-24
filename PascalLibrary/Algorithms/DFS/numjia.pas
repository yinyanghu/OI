program numberjia;
var n:integer;
    total:extended;
    s:array[0..255] of word;

procedure print(k:integer);
 var i:integer;
 begin
     for i:=1 to k do write(s[i]:3);
     writeln;
     total:=total+1;
 end;

procedure try(n,k:longint);
 var i,rest:integer;
 begin
     for i:=1 to n do
       if (s[k-1]<=i) then begin
           s[k]:=i;
           rest:=n-i;
           if (rest>0) then try(rest,k+1)
              else if (rest=0) then print(k);
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