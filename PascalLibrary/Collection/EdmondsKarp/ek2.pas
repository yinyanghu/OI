program edmondskarp;
const maxn=100;
type node=record
	 pre,aug,x:longint;
     end;
var a,f:array[1..maxn,1..maxn] of longint;
    n:longint;
procedure init;
 var i,m,x,y,k:longint;
 begin
     fillchar(a,sizeof(a),0);
     assign(input,'ek.in'); reset(input);
     readln(m,n);
     for i:=1 to m do begin
         readln(x,y,k);
         inc(a[x,y],k);
     end;
     close(input);
 end;
    
function netflow:longint;
 var used:array[1..maxn] of boolean;
     q:array[1..maxn] of node;
     ans,p,total:longint;
 function findaugpath:boolean;
  var l,r,i:longint;
  begin
      fillchar(used,sizeof(used),true);
      l:=0; r:=1; q[1].x:=1; q[1].aug:=maxlongint;
      used[1]:=false;
      while l<r do begin
          inc(l);
          for i:=1 to n do
              if (used[i]) and (a[q[l].x,i]>f[q[l].x,i]) then begin
                  used[i]:=false; inc(r);
                  q[r].x:=i; q[r].aug:=a[q[l].x,i]-f[q[l].x,i];
                  if q[l].aug<q[r].aug then q[r].aug:=q[l].aug;
                  q[r].pre:=l;
              end else if (used[i]) and (f[i,q[l].x]>0) then begin
                  used[i]:=false; inc(r);
                  q[r].x:=i; q[r].aug:=f[i,q[l].x];
                  if q[l].aug<q[r].aug then q[r].aug:=q[l].aug;
                  q[r].pre:=l;
              end;
          if q[l].x=n then begin
              p:=l; findaugpath:=true;
              exit;
          end;
      end;
      findaugpath:=false;
  end;
 
 procedure augpath(k:longint);
  begin
      if q[k].pre<>0 then begin
          augpath(q[k].pre);
          if a[q[q[k].pre].x,q[k].x]>f[q[q[k].pre].x,q[k].x] then inc(f[q[q[k].pre].x,q[k].x],ans)
          	else dec(f[q[k].x,q[q[k].pre].x],ans);
      end;
  end;
  
 begin
     fillchar(q,sizeof(q),0);
     total:=0;
     while findaugpath do begin
         ans:=q[p].aug;
         total:=total+ans;
         augpath(p);
     end;
     netflow:=total;
 end;
 
procedure main;
 begin
     assign(output,'ek.out'); rewrite(output);
     writeln(netflow);
     close(output);
 end;
 
begin
    init;
    main;
end.