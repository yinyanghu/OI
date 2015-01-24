program link;
type pointer=^node;
     node=record
         data:integer;
         next:pointer;
     end;
var head:pointer;
procedure creat(var head:pointer);
 begin
     head:=nil;
     for i:=n downto 1 do begin
         new(p);
         p^.data:=a[i];
         p^.next:=head;
         head:=p;
     end;
     new(p);
     p^.next:=head;
     head:=p;
 end;
procedure insertlink(x:integer; t:integer; var head:pointer);
 begin
     new(s);
     s^.data:=x;
     p:=head;
     j:=0;
     while (p<>nil) and (j+1<i) do begin
         p:=p^.next;
         inc(j);
     end;
     if p<>nil then begin
         s^.next:=p^.next;
         p^.next:=s;
     end;
 end;
procedure del(i:integer; var head:pointer);
 begin
     p:=head;
     j:=0;
     while (p^.next<>nil) and (j<i-1) do begin
         p:=p^.next;
         inc(j);
     end;
     if p^.next=nil then writeln('Nil')
       else begin
           q:=p^.next;
           p^.next:=p^.next^.next;
           dispose(q);
       end;
 end;
function get(i:integer; var head:pointer):integer;
 begin
     p:=head^.next; j:=1;
     while (p<>nil) and (j<i) do begin
         p:=p^.next;
         inc(j);
     end;
     if p=nil then writeln('Nil')
       else get:=p^.data;
 end;