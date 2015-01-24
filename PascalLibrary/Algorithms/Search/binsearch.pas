program binsearch;
var a:array[1..10000] of integer;
    k,n,i:integer;
{procedure search(l,r:integer);
 var x:integer;
 begin
     while l<=r do begin
         x:=(l+r) div 2;
         if a[x]=k then begin
            writeln('Number ',x);
            exit;
         end;
         if a[x]>k then r:=x-1 else l:=x+1;
     end;
 end;}
procedure search(l,r:integer);
 var x:integer;
 begin
     if l>r then begin
         writeln('No answer!');
         exit;
     end;
     x:=random(r-l+1)+l;
     if a[x]=k then begin
         writeln('Number ',x);
         exit;
     end;
     if a[x]>k then search(l,x-1) else search(x+1,r);
 end;

begin
    writeln('Enter n=');
    readln(n);
    writeln('Search=');
    readln(k);
    writeln('Enter number=');
    for i:=1 to n do read(a[i]);
    randomize;
    search(1,n);
end.