program stackppt;
const m=100;
type stack=array[1..m] of integer;
var s:stack;
    t:integer;

procedure push(var s:stack; x:integer ; var t:integer);
 begin
     if t=m then writeln('overflow')
       else begin
           inc(t);
           s[t]:=x;
       end;
 end;

function pop(var s:stack; var t:integer):integer;
 begin
     if t=0 then writeln('underflow')
       else begin
           pop:=s[t];
           dec(t);
       end;
 end;

function top(var s:stack; t:integer):integer;
 begin
     if t=0 then writeln('stack empty')
       else top:=s[t];
 end;

function empty(var s:stack):boolean;
 begin
     exit(t=0);
 end;