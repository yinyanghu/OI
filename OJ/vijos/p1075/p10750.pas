program p1075;
const maxn=100000;
type data=record
         x,y:longint;
     end;
var key,s,left,right,h:array[0..maxn] of longint;
    a:array[1..maxn] of data;
    ans:array[0..maxn] of longint;
    tt,n:longint;

procedure init;
 var i:longint;
 begin
     readln(n);
     for i:=1 to n do readln(a[i].x,a[i].y);
 end;

procedure qsort(l,r:longint);
 var i,j,k1,k2,s:longint;
     y:data;
 begin
     i:=l; j:=r; s:=random(r-l+1)+l;
     k1:=a[s].x; k2:=a[s].y;
     repeat
	while (a[i].x<k1) or ((a[i].x=k1) and (a[i].y<k2)) do inc(i);
	while (a[j].x>k1) or ((a[j].x=k1) and (a[j].y>k2)) do dec(j);
        if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
            inc(i); dec(j);
	end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

procedure main;
 var t,k,i,p:longint;
 function max(a,b:longint):longint;
  begin
      if a>b then max:=a else max:=b;
  end;

 procedure right_rotate(var t:longint);
  begin
      k:=left[t];
      left[t]:=right[k];
      right[k]:=t;
      s[k]:=s[t];
      s[t]:=s[left[t]]+s[right[t]]+1;
      h[t]:=max(h[left[t]],h[right[t]])+1;
      h[k]:=max(h[left[k]],h[right[k]])+1;
      t:=k;
  end;

 procedure left_rotate(var t:longint);
  begin
      k:=right[t];
      right[t]:=left[k];
      left[k]:=t;
      s[k]:=s[t];
      s[t]:=s[left[t]]+s[right[t]]+1;
      h[t]:=max(h[left[t]],h[right[t]])+1;
      h[k]:=max(h[left[k]],h[right[k]])+1;
      t:=k;
  end;

 procedure insert(var t,v:longint);
  begin
     if t=0 then begin
        inc(tt);
        t:=tt;
        key[t]:=v;
        s[t]:=1;
        h[t]:=0;
        left[t]:=0;
        right[t]:=0;
     end else begin
         inc(s[t]);
         if v<=key[t] then begin
            insert(left[t],v);
            h[t]:=max(h[left[t]],h[right[t]])+1;
            if h[left[t]]-h[right[t]]>1 then
               if v<key[left[t]] then
                   right_rotate(t)
               else begin
                   left_rotate(left[t]);
                   right_rotate(t);
               end;
         end else begin
             insert(right[t],v);
             h[t]:=max(h[left[t]],h[right[t]])+1;
             if h[right[t]]-h[left[t]]>1 then
                if v>=key[right[t]] then
                    left_rotate(t)
                else begin
                    right_rotate(right[t]);
                    left_rotate(t);
                end;
         end;
     end;
 end;

 function rank(var t,v:longint):longint;
  begin
      if t=0 then exit(0);
      if v<key[t] then rank:=rank(left[t],v)
         else if v>key[t] then rank:=s[left[t]]+1+rank(right[t],v)
	     else rank:=rank(left[t],v)+1;
  end;

 begin
     tt:=0; t:=0; s[0]:=0; h[0]:=-1;
     fillchar(ans,sizeof(ans),0);
     qsort(1,n);
     for i:=1 to n do begin
         p:=rank(t,a[i].y);
         inc(ans[p]);
         insert(t,a[i].y);
     end;
     for i:=0 to n-1 do writeln(ans[i]);
 end;

begin
    init;
    main;
end.
