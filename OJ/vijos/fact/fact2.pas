program fact;
const
    fbc:array[0..9] of integer=(1,1,2,6,4,1,6,2,6,4);
    t1:array[0..9] of integer=(1,1,2,6,4,2,2,4,2,8);
    aper=6;

var n:ansistring;

function find(n:ansistring):integer;
 var total,k,g,j:integer;
 begin
    total:=1;
    while length(n)>1 do begin
         k:=ord(n[length(n)])-48;
         if (length(n)>2) or (n>='15') then g:=6 else g:=1;
         if k>=5 then total:=total*2;
         total:=total*fbc[k]*aper*g;
         if (length(n)>2) or (n>='20') then begin
            k:=ord(n[pred(length(n))])-48;
            if odd(k) then g:=4 else g:=6;
         end else g:=4;
         total:=(total*g) mod 10;
         if n[1]>='5' then n:='0'+n;
         for j:=1 to pred(length(n)) do
           n[j]:=chr((((ord(n[j])-48) shl 1) mod 10)+ord(n[succ(j)]>='5')+48);
         delete(n,length(n),1);
     end;
     find:=(t1[ord(n[1])-48]*total) mod 10;
 end;

begin
    readln(n);
    writeln(find(n));
end.