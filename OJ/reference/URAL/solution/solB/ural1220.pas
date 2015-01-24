type
                tnode   =       ^node;
                node    =       record
                  num   :       longint;
                  next  :       tnode;
                end;
var
                stack   :       array[1..2000] of tnode;
                x,y,n   :       longint;
                p       :       tnode;

procedure push;
begin
  new(p);
  p^.num:=y;
  p^.next:=stack[x];
  stack[x]:=p;
end;

procedure pop;
begin
  writeln(stack[x]^.num);
  p:=stack[x]^.next;
  dispose(stack[x]);
  stack[x]:=p;
end;

var
                i,j,k   :       longint;
                c       :       char;
begin
  readln(n);
  for i:=1 to n do
    begin
      read(c,c,c,c);
      case c of
        'H' : begin
                readln(x,y);
                push;
              end;
        ' ' : begin
                readln(x);
                pop;
              end;
      end;
    end;
end.