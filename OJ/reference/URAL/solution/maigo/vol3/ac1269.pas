program ural1269;
const
  maxl=100000;
var
  fc,next,suf,q:array[1..maxl]of longint;
  len:array[1..maxl]of word;
  ch:array[1..maxl]of char;
function child(a,x:longint;c:char):longint;
  var
    p:longint;
  begin
    repeat
      p:=fc[x];
      while (p>0) and (ch[p]<>c) do p:=next[p];
      if p>0 then begin
        child:=p;exit;
      end
      else if a=1 then begin
        child:=0;exit;
      end
      else if x=1 then begin
        child:=1;exit;
      end
      else
        x:=suf[x];
    until false;
  end;
procedure build_trie;
  var
    n,i,p,l,nodes,t:longint;
    c:char;
  begin
    readln(n);nodes:=1;
    for i:=1 to n do begin
      l:=0;p:=1;
      repeat
        inc(l);read(c);
        t:=child(1,p,c);
        if t>0 then
          p:=t
        else begin
          inc(nodes);
          ch[nodes]:=c;next[nodes]:=fc[p];fc[p]:=nodes;
          p:=nodes;
        end;
        if len[p]>0 then break;
      until eoln;
      readln;len[p]:=l;
    end;
  end;
procedure build_graph;
  var
    f,r,p:longint;
  begin
    suf[1]:=1;f:=0;r:=1;q[1]:=1;
    repeat
      inc(f);p:=fc[q[f]];
      while p>0 do begin
        inc(r);q[r]:=p;
        if f=1 then suf[p]:=1 else suf[p]:=child(2,suf[q[f]],ch[p]);
        if len[suf[p]]>len[p] then len[p]:=len[suf[p]];
        p:=next[p];
      end;
    until f=r;
  end;
procedure scan;
  var
    n,i,j,p,ans:longint;
    c:char;
  begin
    readln(n);
    for i:=1 to n do begin
      ans:=maxlongint;j:=0;p:=1;
      while not eoln do begin
        inc(j);read(c);p:=child(2,p,c);
        if (len[p]>0) and (j-len[p]<ans) then ans:=j-len[p];
      end;
      readln;
      if ans<maxlongint then begin writeln(i,' ',ans+1);exit;end;
    end;
    writeln('Passed');
  end;
begin
  build_trie;
  build_graph;
  scan;
end.
