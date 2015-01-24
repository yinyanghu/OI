program queue;
const m=100;
type queuetype=array[1..m] of integer;
var q:queuetype;
    r,f:integer;

procedure add(var q:queuetype; x:integer; var r:integer);
 begin
     if r=m then writeln('overflow')
       else begin
           inc(r);
           q[r]:=x;
       end;
 end;

procedure del(var q:queuetype; var y,f:integer);
 begin
     if f=r then writeln('underflow')
       else begin
           inc(f);
           y:=q[f];
       end;
 end;

function empty(q:queuetype):boolean;
 begin
     exit(f=r);
 end;