program ural1158;
const
  maxn=50;
  maxp=10;
  maxl=10;
  maxnodes=maxl*maxp+1;
  base=1000000000;
type
  bignum=array[-1..10]of longint;
var
  alphabet:string;
  child:array[1..maxnodes,1..maxn]of byte;
  danger,v:array[1..maxnodes]of boolean;
  suffix,q:array[1..maxnodes]of byte;
  count:array[boolean,1..maxnodes]of bignum;
  n,m,p,nodes:word;
  c:char;
  ans:bignum;
procedure build_trie;
  var
    x,y,i:byte;
  begin
    readln(n,m,p);
    readln(alphabet);
    nodes:=1;
    for i:=1 to p do begin
      x:=1;
      repeat
        read(c);y:=pos(c,alphabet);
        if child[x,y]=0 then begin
          inc(nodes);child[x,y]:=nodes;
        end;
        x:=child[x,y];
        if danger[x] then break;
      until seekeoln;
      danger[x]:=true;readln;
    end;
  end;
procedure build_graph;
  var
    f,r,y:byte;
  begin
    f:=0;r:=0;
    for y:=1 to n do
      if child[1,y]=0 then
        child[1,y]:=1
      else begin
        inc(r);q[r]:=child[1,y];suffix[q[r]]:=1;
      end;
    while f<r do begin
      inc(f);
      danger[q[f]]:=danger[q[f]] or danger[suffix[q[f]]];
      if not danger[q[f]] then
        for y:=1 to n do
          if child[q[f],y]=0 then
            child[q[f],y]:=child[suffix[q[f]],y]
          else begin
            inc(r);q[r]:=child[q[f],y];suffix[q[r]]:=child[suffix[q[f]],y];
          end;
    end;
  end;
procedure add(var a,b:bignum);
  var
    i:byte;
  begin
    if b[-1]>a[-1] then a[-1]:=b[-1];
    for i:=0 to a[-1] do begin
      inc(a[i],b[i]);
      inc(a[i+1],a[i] div base);
      a[i]:=a[i] mod base;
    end;
    if a[a[-1]+1]>0 then inc(a[-1]);
  end;
procedure out(var a:bignum);
  var
    i,j:shortint;
    s:string;
  begin
    write(a[a[-1]]);
    for i:=a[-1]-1 downto 0 do begin
      str(a[i],s);
      for j:=length(s) to 8 do write(0);
      write(s);
    end;
    writeln;
  end;
procedure stat;
  var
    l:byte;
    b1,b2:boolean;
  procedure dfs1(x:byte);
    var
      y:byte;
    begin
      if v[x] then exit;
      v[x]:=true;
      for y:=1 to n do
        if not danger[child[x,y]] then begin
          add(count[b1,child[x,y]],count[b2,x]);
          dfs1(child[x,y]);
        end;
    end;
  procedure dfs2(x:byte);
    var
      y:byte;
    begin
      if v[x] then exit;
      v[x]:=true;
      add(ans,count[b1,x]);
      for y:=1 to n do
        if not danger[child[x,y]] then
          dfs2(child[x,y]);
    end;
  begin
    count[false,1,0]:=1;
    for l:=1 to m do begin
      b1:=odd(l);b2:=not b1;
      fillchar(count[b1],sizeof(count[b1]),0);
      fillchar(v,sizeof(v),0);
      dfs1(1);
    end;
    fillchar(v,sizeof(v),0);
    dfs2(1);
    out(ans);
  end;
begin
  build_trie;
  build_graph;
  stat;
end.
