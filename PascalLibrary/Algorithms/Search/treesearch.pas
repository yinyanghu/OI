program treesearch;
const maxn=1000;
type point=^node;
     node=record
         w:integer;
         l,r:point;
     end;
var a:array[1..maxn] of longint;
    root,first:point;
    k:boolean;
    i,x,n:integer;
procedure make(d:integer; var p:point);
 begin
     if p=nil then begin
         new(p);
         with p^ do begin
             w:=d;
             r:=nil;
             l:=nil;
         end;
         if k then begin
             root:=p;
             k:=false;
         end;
     end else with p^ do if d>=w then make(d,r) else make(d,l);
 end;

function search(x:integer; p:point):boolean;
 begin
     if p=nil then exit(false);
     if x=p^.w then exit(true);
     if x<p^.w then search:=search(x,p^.l)
       else search:=search(x,p^.r);
 end;

begin
    first:=nil;
    k:=true;
    readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do make(a[i],first);
    readln(x);
    if search(x,first) then writeln('Yes') else writeln('No');
end.