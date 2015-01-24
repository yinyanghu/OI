var

        adj     :       array[0..101,0..101] of longint;
        f       :       array[0..101       ] of longint;
        ans,n   :       longint;
        l,r,i,j :       longint;

begin
//  assign(input,'d.in');reset(input);
  fillchar(adj,sizeof(adj),0);
  readln(n);
  ans:=-maxlongint;
  for i:=1 to n do
    for j:=1 to n do
      begin
        read(adj[i,j]);
        inc(adj[i,j],adj[i,j-1]);
      end;
  for l:=1 to n do
    for r:=l to n do
      begin
        fillchar(f,sizeof(f),0);
        for i:=1 to n do
          begin
            f[i]:=f[i-1]+adj[i,r]-adj[i,l-1];
            if adj[i,r]-adj[i,l-1]>f[i]
              then f[i]:=adj[i,r]-adj[i,l-1];
            if f[i]>ans then ans:=f[i];
          end;
      end;
  writeln(ans);
end.