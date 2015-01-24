program joesph;
type link=^node;
     node=record
         data:integer;
         next:link;
     end;
var head,q,p:link;
    m,n,i:integer;
begin
    readln(m,n);
    for i:=1 to m do begin
        new(q);
        q^.data:=i;
        if i=1 then head:=q
          else p^.next:=q;
        p:=q;
        if i=m then p^.next:=head;
    end;
    p:=head;
    repeat
       for i:=1 to n-2 do p:=p^.next;
       q:=p^.next;
       p^.next:=p^.next^.next;
       write(q^.data,' ');
       dispose(q);
       p:=p^.next;
    until p=p^.next;
    write(p^.data);
end.