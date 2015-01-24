var
        adj     :       array[1..100,0..100] of longint;
        color   :       array[1..100] of longint;
        n,ans   :       longint;

procedure prepare;
var
        i,j     :       longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      adj[i,0]:=0;
      repeat
        read(j);
        if j=0 then break;
        inc(adj[i,0]);
        adj[i,adj[i,0]]:=j;
      until false;
      if adj[i,0]=0 then
        begin
          writeln(0);
          halt;
        end;
    end;
  fillchar(color,sizeof(color),255);
end;

procedure work;
var
        q                 :       array[1..10000] of longint;
        i,j,x,head,tail   :       longint;
begin
  color[1]:=0;
  for x:=1 to n do
    if color[x]=-1 then
      begin
        head:=1;tail:=1;
        q[1]:=x;
        repeat
          j:=q[head];
          for i:=1 to adj[j,0] do
            if color[adj[j,i]]=-1 then
              begin
                inc(tail);
                q[tail]:=adj[j,i];
                color[adj[j,i]]:=(color[j]+1) and 1;
              end;
          inc(head);
        until head>tail;
      end;
end;

procedure print;
var
        i       :       longint;
begin
  for i:=1 to n do if color[i]=1 then inc(ans);
  writeln(ans);
  for i:=1 to n do
    if color[i]=1 then
      begin
        dec(ans);
        write(i);
        if ans<>0 then write(' ') else writeln;
      end;
end;

begin
//  assign(input,'d.in');reset(input);
  prepare;
  work;
  print;
end.