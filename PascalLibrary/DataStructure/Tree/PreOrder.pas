program xianxutree;
var b:array[1..31] of char;
    e:array[1..63] of byte;
    n,h,i,k:integer;
procedure tree(t:integer);
 begin
     if e[t]=0 then exit;
     write(b[t],' ');
     e[t]:=0;
     t:=2*t;  tree(t);
     t:=t+1;  tree(t);
 end;

begin
    readln(n);
    fillchar(e,sizeof(e),0);
    k:=trunc(exp(n*ln(2)))-1;
    for i:=1 to k do e[i]:=1;
    for i:=1 to 26 do b[i]:=chr(64+i);
    for i:=1 to 5 do b[26+i]:=chr(48+i);
    h:=1;
    tree(h);
end.
