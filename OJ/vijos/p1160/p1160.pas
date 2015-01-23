program p1160;
const maxn=400000;
var key,s,left,right:array[0..maxn] of longint;
    tt,a,b,t,k,total,l,n,i:longint;
procedure right_rotate(var t:longint);
 begin
     k:=left[t];
     left[t]:=right[k];
     right[k]:=t;
     s[k]:=s[t];
     s[t]:=s[left[t]]+s[right[t]]+1;
     t:=k;
 end;

procedure left_rotate(var t:longint);
 begin
     k:=right[t];
     right[t]:=left[k];
     left[k]:=t;
     s[k]:=s[t];
     s[t]:=s[left[t]]+s[right[t]]+1;
     t:=k;
 end;

procedure maintain(var t:longint; flag:boolean);
 begin
    if flag=false then
       if s[left[left[t]]]>s[right[t]] then right_rotate(t)
          else if s[right[left[t]]]>s[right[t]] then begin
             left_rotate(left[t]);
             right_rotate(t);
          end else exit
    else
       if s[right[right[t]]]>s[left[t]] then left_rotate(t)
          else if s[left[right[t]]]>s[left[t]] then begin
             right_rotate(right[t]);
             left_rotate(t);
          end else exit;
    maintain(left[t],false);
    maintain(right[t],true);
    maintain(t,true);
    maintain(t,false);
end;

procedure insert(var t,v:longint);
 begin
     if t=0 then begin
        inc(tt);
        t:=tt;
        key[t]:=v;
        s[t]:=1;
        left[t]:=0;
        right[t]:=0;
     end else begin
         inc(s[t]);
         if v<key[t] then insert(left[t],v)
            else insert(right[t],v);
         maintain(t,v>=key[t]);
     end;
 end;

function delete(var t:longint; v:longint):longint;
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

function select(var t:longint; k:longint):longint;
 begin
     if k=s[right[t]]+1 then exit(key[t]);
     if k<=s[right[t]] then select:=select(right[t],k)
       else select:=select(left[t],k-1-s[right[t]]);
 end;

begin
    assign(input,'test.in'); reset(input);
    assign(output,'test.out'); rewrite(output);
    tt:=0; t:=0; s[0]:=0;
    readln(n); total:=1;
    for i:=1 to n do begin
        readln(a,b);
        if a>total then a:=total;
        if a=1 then begin
           writeln('facer');
           inc(total);
           insert(t,b);
        end else begin
            dec(a);
            l:=select(t,a);
            if l>b then begin
               writeln('facer');
               inc(total);
               insert(t,b);
            end else begin
                writeln('archer');
                dec(total);
                delete(t,l);
	    end;
        end;
    end;
    close(input);
    close(output);
end.