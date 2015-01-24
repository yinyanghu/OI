{$inline on}
program BST;
const maxn=2000000;
var key,left,right,a,b,s:array[0..maxn] of longint; 
    tt,q:longint;

procedure init;
 begin
     readln(q);
     for q:=1 to q do begin
         read(a[q]);
         if (a[q]<>8) and (a[q]<>9) then readln(b[q]);
     end;
 end;

procedure work;
 var t:longint;
 procedure insert(var t,v:longint);inline;
  begin
      if t=0 then begin
         inc(tt);
         t:=tt;
         key[t]:=v;
         left[t]:=0;
         right[t]:=0;
         s[t]:=1;
      end else begin
          inc(s[t]);
          if v<key[t] then insert(left[t],v)
             else insert(right[t],v);
      end;
  end;

 function delete(var t:longint; v:longint):longint;inline;
  begin
      dec(s[t]);
      if (v=key[t]) or (v<key[t]) and (left[t]=0) or (v>key[t]) and (right[t]=0) then begin
         delete:=key[t];
         if (left[t]=0) or (right[t]=0) then t:=left[t]+right[t]
           else key[t]:=delete(left[t],key[t]+1);
      end else
         if v<key[t] then delete:=delete(left[t],v)
           else delete:=delete(right[t],v);
  end;

 function find(var t,v:longint):boolean;inline;
  begin
      if t=0 then exit(false);
      if v<key[t] then find:=find(left[t],v)
        else find:=(key[t]=v) or find(right[t],v);
  end;

 function rank(var t,v:longint):longint;inline;
  begin
      if t=0 then exit(1);
      if v<=key[t] then rank:=rank(left[t],v)
        else rank:=s[left[t]]+1+rank(right[t],v);
  end;

 function select(var t:longint; k:longint):longint;inline;
  begin
      if k=s[left[t]]+1 then exit(key[t]);
      if k<=s[left[t]] then select:=select(left[t],k)
        else select:=select(right[t],k-1-s[left[t]]);
  end;
 
 function pred(var t,v:longint):longint;inline;
  begin
      if t=0 then exit(v);
      if v<=key[t] then pred:=pred(left[t],v)
        else begin
            pred:=pred(right[t],v);
            if pred=v then pred:=key[t];
        end;
  end;

 function succ(var t,v:longint):longint;inline;
  begin
      if t=0 then exit(v);
      if key[t]<=v then succ:=succ(right[t],v)
        else begin
            succ:=succ(left[t],v);
            if succ=v then succ:=key[t];
        end;
  end;

 function maximum(t:longint):longint;inline;
  begin
      while right[t]<>0 do t:=right[t];
      exit(key[t]);
  end;

 function minimum(t:longint):longint;inline;
  begin
      while left[t]<>0 do t:=left[t];
      exit(key[t]);
  end;

 begin
    tt:=0; t:=0; s[0]:=0;
    for q:=1 to q do
       case a[q] of
           1:insert(t,b[q]);
           2:delete(t,b[q]);
           3:writeln(find(t,b[q]));
           4:writeln(rank(t,b[q]));
           5:writeln(select(t,b[q]));
           6:writeln(pred(t,b[q]));
           7:writeln(succ(t,b[q]));
           8:writeln(maximum(t));
           9:writeln(minimum(t));
       end;
 end;

begin
    assign(input,'bst.in'); reset(input);
    assign(output,'bst.out'); rewrite(output);
    init;
    work;
    close(input);
    close(output);
end.
