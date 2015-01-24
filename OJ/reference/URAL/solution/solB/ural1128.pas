type
        tnode      =       record
          v,next   :       longint;
        end;

var
        q          :       array[1..100000] of longint;
        h          :       array[1..100000] of tnode;
        adj        :       array[1..100000] of longint;
        check,color:       array[1..100000] of boolean;
        size,n     :       longint;
        i,j,k,a    :       longint;
        head,tail  :       longint;
        ans        :       longint;

function find:boolean;
var
        timer   :       longint;
begin
  for i:=1 to n do
    if not(check[i]) then
      begin
        check[i]:=true;
        timer:=0;
        j:=adj[i];
        while j<>0 do
          begin
            if not(color[i] xor color[h[j].v]) then inc(timer);
            if timer>1 then break;
            j:=h[j].next;
          end;
        if timer>1 then
          begin
            color[i]:=not color[i];
            exit(true)
          end;
      end;
  exit(false);
end;

begin
//  assign(input,'d.in');reset(input);
  readln(n);
  for i:=1 to n do
    begin
      read(k);
      for j:=1 to k do
        begin
          read(a);
          inc(size);
          h[size].v:=a;
          h[size].next:=adj[i];
          adj[i]:=size;
        end;
      readln;
    end;
  head:=1;
  tail:=1;
  q[1]:=1;
  color[1]:=true;
  repeat
    i:=adj[head];
    check[head]:=true;
    while i<>0 do
      begin
        if not color[h[i].v] then
          begin
            color[h[i].v]:=not color[head];
            inc(tail);
            q[tail]:=h[i].v;
          end;
        i:=h[i].next;
      end;
    inc(head);
  until head>tail;
  fillchar(check,sizeof(check),false);
  repeat
  until not find;
  for i:=1 to n do
    if color[i] then inc(ans);
  if ans<n-ans then
    begin
      writeln(ans);
      for i:=1 to n do
        if color[i] then write(i,' ');
    end
  else
    begin
      writeln(n-ans);
      for i:=1 to n do
        if not color[i] then write(i,' ');
    end
end.
