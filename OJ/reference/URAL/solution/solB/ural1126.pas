{$inline on}
var
        t,l,r,aux,h       :       array[1..30000] of longint;
        m,size,root,k     :       longint;

procedure rotate_left(var i:longint);inline;
var
        j       :       longint;
begin
  if i=0 then exit;
  j:=r[i];
  r[i]:=l[j];
  l[j]:=i;
  i:=j;
end;

procedure rotate_right(var i:longint);inline;
var
        j       :       longint;
begin
  if i=0 then exit;
  j:=l[i];
  l[i]:=r[j];
  r[j]:=i;
  i:=j;
end;

procedure insert(var i:longint;x:longint);inline;
begin
  if i=0 then
    begin
      inc(size);
      i:=size;
      t[i]:=x;
      l[i]:=0;
      r[i]:=0;
      aux[i]:=random(maxint)+1;
    end
  else
    if x<t[i] then
      begin
        insert(l[i],x);
        if aux[l[i]]>aux[i] then
          rotate_right(i);
      end
    else
      begin
        insert(r[i],x);
        if aux[r[i]]>aux[i] then
          rotate_left(i);
      end;
end;

procedure delete(var i:longint;x:longint);inline;
begin
  if i=0 then exit;
  if t[i]=x then
    begin
      if (l[i]=0) or (r[i]=0) then
        begin
          if l[i]=0 then i:=r[i]
                    else i:=l[i];
        end
      else
        if aux[l[i]]>aux[r[i]] then
          begin
            rotate_right(i);
            delete(r[i],x);
          end
        else
          begin
            rotate_left(i);
            delete(l[i],x);
          end;
    end
  else
    if x<t[i] then
      begin
        delete(l[i],x);
        if l[i]=0 then exit;
        if aux[l[i]]>aux[i] then
          rotate_right(i);
      end
    else
      begin
        delete(r[i],x);
        if r[i]=0 then exit;
        if aux[r[i]]>aux[i] then
          rotate_left(i);
      end;
end;

function getmax(i:longint):longint;inline;
begin
  while r[i]<>0 do i:=r[i];
  getmax:=t[i];
end;

var
        i       :       longint;
begin
  writeln;
  writeln;
//   assign(input,'d.in');reset(input);
  readln(m);
  for i:=1 to m do
    begin
      readln(k);
      h[i]:=k;
      insert(root,k);
    end;

  repeat
    inc(i);
    readln(k);
    if k=-1 then break;
    h[i]:=k;
    writeln(getmax(root));
    delete(root,h[i-m]);
    insert(root,k);
  until false;
  writeln(getmax(root));
end.